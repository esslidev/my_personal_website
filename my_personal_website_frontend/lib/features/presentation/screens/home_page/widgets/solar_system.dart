import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/responsive_size_adapter.dart';

class SolarSystem extends StatefulWidget {
  final double size;
  const SolarSystem({super.key, required this.size});

  @override
  State<SolarSystem> createState() => _SolarSystemState();
}

class _SolarSystemState extends State<SolarSystem> {
  late ResponsiveSizeAdapter r;

  @override
  void initState() {
    super.initState();
    r = ResponsiveSizeAdapter(context);
  }

  Widget _buildOrbitingPlanet({required double size}) {
    return Container(
      width: size,
      height: size,
      margin: r.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.dark.primary.withValues(
            alpha: .08,
          ), // Border color (the circular line)
          width: r.size(1), // Border width (thickness of the line)
        ),
      ),
    );
  }

  Widget _buildSolarSystem(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: _buildOrbitingPlanet(size: widget.size), // Largest circle
            ),
            Align(
              alignment: Alignment.center,
              child: _buildOrbitingPlanet(
                size: widget.size * 0.8,
              ), // 80% size of the largest
            ),
            Align(
              alignment: Alignment.center,
              child: _buildOrbitingPlanet(
                size: widget.size * 0.6,
              ), // 60% size of the largest
            ),
            Align(
              alignment: Alignment.center,
              child: _buildOrbitingPlanet(
                size: widget.size * 0.4,
              ), // 40% size of the largest
            ),
            Align(
              alignment: Alignment.center,
              child: _buildOrbitingPlanet(
                size: widget.size * 0.2,
              ), // Smallest circle (20% of largest)
            ),
          ],
        ),
      ),
    );
  }

  //----------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return _buildSolarSystem(context);
  }
}
