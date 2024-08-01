import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/enums/app_enums.dart';
import '../../../../core/resources/custom_dropdown_menu_item.dart';
import '../../../../core/resources/drop_down_style.dart';
import '../../../../core/util/responsive_size_adapter.dart';

class CustomButtonStyle {
  final double? width;
  final double? height;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? textColor;
  final List<BoxShadow>? boxShadow;

  CustomButtonStyle({
    this.width,
    this.height,
    this.iconColor,
    this.backgroundColor,
    this.textColor,
    this.boxShadow,
  });
}

class CustomButton extends StatefulWidget {
  final double? width;
  final double? height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double? borderRadius;
  final String? svgIconPath;
  final double? iconWidth;
  final double? iconHeight;
  final CustomButtonIconPosition iconPosition;
  final Color? iconColor;
  final double? iconTextPadding;
  final String? text;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? textColor;
  final List<BoxShadow>? boxShadow;
  final bool isActive;
  final CustomButtonStyle? onActiveStyle;
  final CustomButtonStyle? onHoverStyle;
  final VoidCallback? onPressed;
  final List<CustomDropdownMenuItem>? dropdownItems;
  final DropdownStyle? dropdownStyle;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius,
    this.svgIconPath,
    this.iconWidth,
    this.iconHeight,
    this.iconPosition = CustomButtonIconPosition.right,
    this.iconColor,
    this.iconTextPadding,
    this.text,
    this.textSize,
    this.fontWeight,
    this.backgroundColor,
    this.textColor,
    this.boxShadow,
    this.isActive = false,
    this.onActiveStyle,
    this.onHoverStyle,
    this.onPressed,
    this.dropdownItems,
    this.dropdownStyle,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late ResponsiveSizeAdapter R;

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  bool _isHovered = false;
  bool _isDropdownVisible = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = widget.onHoverStyle != null ? isHovered : false;
    });
  }

  void _toggleDropdown() {
    if (_isDropdownVisible) {
      _hideDropdown();
    } else {
      _showDropdown();
    }
  }

  void _showDropdown() {
    final overlay = Overlay.of(context);
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      overlay.insert(_overlayEntry!);
      setState(() {
        _isDropdownVisible = true;
      });
    }
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isDropdownVisible = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(builder: (context) {
      final double xOffset;
      switch (widget.dropdownStyle?.dropdownAlignment) {
        case DropdownAlignment.start:
          xOffset = 0;
          break;
        case DropdownAlignment.center:
          xOffset = -((widget.width ?? R.size(200)) / 2);
          break;
        case DropdownAlignment.end:
        default:
          xOffset = -(widget.width ?? R.size(200));
          break;
      }

      return Positioned(
        width: widget.dropdownStyle?.width ?? R.size(200),
        height: widget.dropdownStyle?.height,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(xOffset, (widget.height ?? 0) + 10),
          child: Material(
            elevation: widget.dropdownStyle?.elevation ?? 3,
            borderRadius: BorderRadius.all(
                widget.dropdownStyle?.borderRadius ?? const Radius.circular(6)),
            color: widget.dropdownStyle?.backgroundColor,
            child: Column(
              children: widget.dropdownItems?.map((item) {
                    return GestureDetector(
                      onTap: () {
                        _hideDropdown();
                        if (item.onTap != null) {
                          item.onTap!();
                        }
                      },
                      child: item.child,
                    );
                  }).toList() ??
                  [],
            ),
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
        link: _layerLink,
        child: MouseRegion(
          onEnter: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: GestureDetector(
            onTap: widget.dropdownItems != null
                ? _toggleDropdown
                : widget.onPressed,
            child: IntrinsicWidth(
              child: Container(
                margin: widget.margin,
                width: widget.width,
                height: widget.height,
                padding: widget.padding,
                decoration: BoxDecoration(
                  color: widget.isActive
                      ? widget.onActiveStyle?.backgroundColor
                      : _isHovered
                          ? widget.onHoverStyle?.backgroundColor
                          : widget.backgroundColor,
                  borderRadius:
                      BorderRadius.circular(widget.borderRadius ?? 0.0),
                  boxShadow: widget.isActive
                      ? widget.onActiveStyle?.boxShadow
                      : _isHovered
                          ? widget.onHoverStyle?.boxShadow
                          : widget.boxShadow,
                ),
                child: _buildButtonContent(),
              ),
            ),
          ),
        ));
  }

  Widget _buildButtonContent() {
    switch (widget.iconPosition) {
      case CustomButtonIconPosition.top:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.svgIconPath != null) _buildIcon(),
            if (widget.svgIconPath != null)
              SizedBox(height: widget.iconTextPadding ?? R.size(6)),
            if (widget.text != null) _buildText(),
          ],
        );
      case CustomButtonIconPosition.left:
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (widget.svgIconPath != null) _buildIcon(),
          if (widget.svgIconPath != null)
            SizedBox(width: widget.iconTextPadding ?? R.size(6)),
          if (widget.text != null) _buildText(),
        ]);
      case CustomButtonIconPosition.right:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (widget.text != null) _buildText(),
            if (widget.svgIconPath != null)
              SizedBox(width: widget.iconTextPadding ?? R.size(6)),
            if (widget.svgIconPath != null) _buildIcon(),
          ],
        );
      case CustomButtonIconPosition.bottom:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.text != null) _buildText(),
            if (widget.svgIconPath != null)
              SizedBox(height: widget.iconTextPadding ?? R.size(6)),
            if (widget.svgIconPath != null) _buildIcon(),
          ],
        );
      default:
        return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          if (widget.svgIconPath != null) _buildIcon(),
          if (widget.svgIconPath != null)
            SizedBox(height: widget.iconTextPadding ?? R.size(6)),
          if (widget.text != null) _buildText(),
        ]); // Handle the default case here if needed
    }
  }

  _buildIcon() {
    return SvgPicture.asset(
      widget.svgIconPath!,
      color: widget.isActive
          ? widget.onActiveStyle?.iconColor
          : _isHovered
              ? widget.onHoverStyle?.iconColor
              : widget.iconColor,
      width: widget.iconWidth,
      height: widget.iconHeight,
    );
  }

  _buildText() {
    return Text(
      widget.text!,
      style: TextStyle(
        color: widget.isActive
            ? widget.onActiveStyle?.textColor
            : _isHovered
                ? widget.onHoverStyle?.textColor
                : widget.textColor,
        fontSize: widget.textSize,
        fontWeight: widget.fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
