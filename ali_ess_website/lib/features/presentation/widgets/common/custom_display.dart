import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDisplay extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool isSvg;
  final double borderWidth;
  final Color borderColor;
  final EdgeInsets borderPadding;
  final bool inFront;
  final VoidCallback? onTap; // Add a callback for taps

  const CustomDisplay({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit,
    this.isSvg = false,
    this.borderWidth = 0.0,
    this.borderColor = Colors.transparent,
    this.borderPadding = const EdgeInsets.all(0.0),
    this.inFront = false,
    this.onTap, // Initialize the callback
  });

  @override
  Widget build(BuildContext context) {
    final double effectiveWidth = width ?? 100;
    final double effectiveHeight = height ?? 100;

    final borderSizeWidth =
        effectiveWidth + borderPadding.left + borderPadding.right;
    final borderSizeHeight =
        effectiveHeight + borderPadding.top + borderPadding.bottom;

    return GestureDetector(
      onTap: onTap, // Set the callback for taps
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          if (!inFront)
            Container(
              width: borderSizeWidth,
              height: borderSizeHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
          SizedBox(
            width: width,
            height: height,
            child: isSvg
                ? SvgPicture.asset(
                    assetPath,
                    width: width,
                    height: height,
                    fit: fit ?? BoxFit.contain,
                  )
                : Image.asset(
                    assetPath,
                    width: width,
                    height: height,
                    fit: fit ?? BoxFit.contain,
                  ),
          ),
          if (inFront)
            Positioned(
              top: -borderPadding.top,
              left: -borderPadding.left,
              child: Container(
                width: borderSizeWidth,
                height: borderSizeHeight,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: borderColor,
                    width: borderWidth,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
