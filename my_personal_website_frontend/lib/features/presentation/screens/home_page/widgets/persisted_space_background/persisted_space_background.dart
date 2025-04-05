import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/resources/persisted_space_background_controller.dart';
import '../../../../../../core/util/responsive_size_adapter.dart';
import '../../../../../../locator.dart';
import 'widgets/persisted_space_background_painter.dart';

class PersistedSpaceBackgroundStar {
  double x;
  double y;
  double z;
  double size = 1;
  Color color = Colors.white;

  PersistedSpaceBackgroundStar({this.x = 0, this.y = 0, this.z = 0});
}

class PersistedSpaceBackground extends StatefulWidget {
  const PersistedSpaceBackground({super.key});

  @override
  State<PersistedSpaceBackground> createState() =>
      _PersistedSpaceBackgroundState();
}

class _PersistedSpaceBackgroundState extends State<PersistedSpaceBackground>
    with SingleTickerProviderStateMixin {
  late ResponsiveSizeAdapter r;
  List<PersistedSpaceBackgroundStar> _stars = [];
  final double _minZ = 1;
  final double _maxZ = 500;

  late AnimationController _controller;

  final PersistedSpaceBackgroundController _spaceBackgroundController =
      locator<PersistedSpaceBackgroundController>();

  Future<void> _initStarsAsync() async {
    _stars = [];
    for (var i = _spaceBackgroundController.starCount; i-- > 0;) {
      PersistedSpaceBackgroundStar star = await _randomizeStarAsync(
        PersistedSpaceBackgroundStar(),
        true,
      );
      _stars.add(star);
    }
  }

  Future<PersistedSpaceBackgroundStar> _randomizeStarAsync(
    PersistedSpaceBackgroundStar star,
    bool randomZ,
  ) async {
    Random rand = Random();
    star.x = (-1 + rand.nextDouble() * 2) * 75;
    star.y = (-1 + rand.nextDouble() * 2) * 75;
    star.z = randomZ ? rand.nextDouble() * _maxZ : _maxZ;

    if (rand.nextDouble() < .1) {
      star.color = AppColors.dark.primary.withValues(alpha: .6);
      star.size = r.size(4) * rand.nextDouble();
    } else {
      star.color = AppColors.colors.white.withValues(alpha: .6);
      star.size = r.size(4) * rand.nextDouble();
    }
    return star;
  }

  void advanceStars() {
    for (var s in _stars) {
      // Move stars on the z, and reset them when they reach the viewport
      s.z -= _spaceBackgroundController.starSpeed;
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
    r = ResponsiveSizeAdapter(context);
    // Using Future.delayed for asynchronous initialization
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initStarsAsync();
      _controller =
          AnimationController(
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
        painter: PersistedSpaceBackgroundPainter(
          _stars,
          starLength:
              (_spaceBackgroundController.starSpeed -
                  _spaceBackgroundController.defaultStarSpeed),
        ),
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
