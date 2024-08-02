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

  const CustomDisplay({
    Key? key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit,
    this.isSvg = false,
    this.borderWidth = 4.0,
    this.borderColor = Colors.black,
    this.borderPadding = const EdgeInsets.all(8.0),
    this.inFront = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Default dimensions for the border if width and height are not provided
    final double effectiveWidth = width ?? 100;
    final double effectiveHeight = height ?? 100;

    final borderSizeWidth =
        effectiveWidth + borderPadding.left + borderPadding.right;
    final borderSizeHeight =
        effectiveHeight + borderPadding.top + borderPadding.bottom;

    return Stack(
      clipBehavior: Clip.none, // Allows border to be outside the image
      alignment: Alignment.center,
      children: [
        // Border container (conditionally placed in front or behind)
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
        // Image or SVG
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
        // Border container (conditionally placed in front or behind)
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
    );
  }
}
