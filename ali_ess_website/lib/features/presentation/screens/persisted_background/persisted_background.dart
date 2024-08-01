import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/resources/persisted_background_star.dart';
import '../../../../locator.dart';
import '../../controllers/persisted_background/persisted_background_controller.dart';
import 'components/persisted_background_painter.dart';

class PersistedBackground extends StatefulWidget {
  const PersistedBackground({super.key});

  @override
  State<PersistedBackground> createState() => _PersistedBackgroundState();
}

class _PersistedBackgroundState extends State<PersistedBackground>
    with SingleTickerProviderStateMixin {
  List<PersistedBackgroundStar> _stars = [];
  final double _minZ = 1;
  final double _maxZ = 500;

  late AnimationController _controller;

  final PersistedBackgroundController _backgroundController =
      locator<PersistedBackgroundController>();

  Future<void> _initStarsAsync() async {
    _stars = [];
    for (var i = _backgroundController.starCount; i-- > 0;) {
      PersistedBackgroundStar star =
          await _randomizeStarAsync(PersistedBackgroundStar(), true);
      _stars.add(star);
    }
  }

  Future<PersistedBackgroundStar> _randomizeStarAsync(
      PersistedBackgroundStar star, bool randomZ) async {
    Random rand = Random();
    star.x = (-1 + rand.nextDouble() * 2) * 75;
    star.y = (-1 + rand.nextDouble() * 2) * 75;
    star.z = randomZ ? rand.nextDouble() * _maxZ : _maxZ;

    if (rand.nextDouble() < .1) {
      star.color = AppColors.dark.primaryColor1.withOpacity(.8);
      star.size = 8 + rand.nextDouble() * 8;
    } else {
      star.color = AppColors.dark.primaryColor3.withOpacity(.8);
      star.size = .5 + rand.nextDouble() * 8;
    }
    return star;
  }

  void advanceStars() {
    for (var s in _stars) {
      // Move stars on the z, and reset them when they reach the viewport
      s.z -= _backgroundController.starSpeed;
      if (s.z < _minZ) {
        _randomizeStarAsync(s, false);
      } else if (s.z > _maxZ) {
        s.z = _minZ;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Using Future.delayed for asynchronous initialization
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initStarsAsync();
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      )
        ..addListener(() {
          setState(() {
            advanceStars();
          });
        })
        ..repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: CustomPaint(
        painter: PersistedBackgroundPainter(_stars,
            starLength: (_backgroundController.starSpeed -
                _backgroundController.defaultStarSpeed)),
        size: screenSize,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
