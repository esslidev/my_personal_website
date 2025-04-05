import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../overlays/menu_dropdown/menu_dropdown.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_field.dart';
import '../../../widgets/common/custom_text.dart';

class Header extends StatefulWidget {
  final Function() onIntroPressed;
  final Function() onAboutPressed;
  final Function() onPortfolioPressed;
  final Function() onGetInTouchPressed;
  final int activeButton;
  const Header({
    super.key,
    required this.onIntroPressed,
    required this.onAboutPressed,
    required this.onPortfolioPressed,
    required this.onGetInTouchPressed,
    this.activeButton = 1,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late ResponsiveSizeAdapter r;

  late MenuDropdownOverlay _menuDropdown;

  @override
  void initState() {
    super.initState();
    r = ResponsiveSizeAdapter(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _menuDropdown = MenuDropdownOverlay(context: context, r: r);
    });
  }

  Widget _buildNavButton({
    required String name,
    bool isActive = false,
    bool isEnabled = true,
    bool isCompact = false,
    bool isLast = false,
    bool isName = false,
    Function()? onPressed,
  }) {
    return CustomButton(
      width: isCompact == true ? r.size(100) : r.size(140),
      height: r.size(34),
      backgroundColor:
          isActive == true
              ? AppColors.colors.white.withValues(alpha: .06)
              : null,
      mainAxisAlignment: MainAxisAlignment.start,
      text: name.toUpperCase(),
      fontFamily: isName == true ? 'dm_serif_display' : null,
      fontSize: isName == true ? r.size(9) : r.size(5.5),
      textColor:
          isActive == true ? AppColors.dark.primary : AppColors.colors.white,
      letterSpacing: r.size(2),
      enabled: isEnabled,
      padding: r.only(left: r.size(4)),
      border: Border(
        top: BorderSide.none, // Excludes the top border
        left: BorderSide(
          color: AppColors.colors.white.withValues(alpha: .1),
          width: r.size(.7),
        ),
        right:
            isLast == true
                ? BorderSide(
                  color: AppColors.colors.white.withValues(alpha: .1),
                  width: r.size(.7),
                )
                : BorderSide.none,
        bottom: BorderSide(
          color: AppColors.colors.white.withValues(alpha: 0.1),
          width: r.size(.7),
        ),
      ),
      animationDuration: 200.ms,
      onHoverStyle: CustomButtonStyle(
        textColor: AppColors.dark.primary,
        backgroundColor: AppColors.colors.white.withValues(alpha: .06),
      ),
      onPressed: (position, size) {
        if (onPressed != null) {
          onPressed();
        }
      },
    );
  }

  Widget _buildHeader(BuildContext context, {bool? isDesktopScreen}) {
    return CustomField(
      mainAxisSize: MainAxisSize.min,
      backgroundColor: AppColors.dark.backgroundPrimary,
      mainAxisAlignment: MainAxisAlignment.center,
      shadowColor: AppColors.colors.black.withValues(alpha: .6),
      shadowBlurRadius: 8,
      shadowOffset: Offset(0, r.size(1)),
      arrangement: FieldArrangement.row,
      children: [
        _buildNavButton(
          name: 'Ali Ess.',
          isName: true,
          isEnabled: false,
          isCompact: isDesktopScreen == true,
        ),
        _buildNavButton(
          name: 'Intro',
          isActive: widget.activeButton == 1,
          isCompact: isDesktopScreen == true,
          onPressed: () {
            widget.onIntroPressed();
          },
        ),
        _buildNavButton(
          name: 'About',
          isActive: widget.activeButton == 2,
          isCompact: isDesktopScreen == true,
          onPressed: () {
            widget.onAboutPressed();
          },
        ),
        _buildNavButton(
          name: 'Portfolio',
          isActive: widget.activeButton == 3,
          isCompact: isDesktopScreen == true,
          onPressed: () {
            widget.onPortfolioPressed();
          },
        ),
        _buildNavButton(
          name: 'Get in touch',
          isActive: widget.activeButton == 4,
          isCompact: isDesktopScreen == true,
          isLast: true,
          onPressed: () {
            widget.onGetInTouchPressed();
          },
        ),
      ],
    );
  }

  Widget _buildHeaderOnTabletMobile(BuildContext context) {
    return CustomField(
      width: double.infinity,
      mainAxisSize: MainAxisSize.min,
      border: Border(
        bottom: BorderSide(
          color: AppColors.colors.white.withValues(alpha: 0.1),
          width: r.size(.6),
        ),
      ),
      shadowColor: AppColors.colors.black.withValues(alpha: .6),
      shadowBlurRadius: 8,
      shadowOffset: Offset(0, r.size(1)),
      backgroundColor: AppColors.dark.backgroundPrimary,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      padding: r.symmetric(vertical: 8, horizontal: 12),
      arrangement: FieldArrangement.row,
      children: [
        CustomText(
          text: 'Ali Ess.',
          fontFamily: 'dm_serif_display',
          fontSize: r.size(12),
          letterSpacing: r.size(2),
        ),
        CustomButton(
          svgIconPath: AppPaths.vectors.menuHamburgerIcon,
          iconWidth: r.size(18),
          iconHeight: r.size(18),
          iconColor: AppColors.colors.white,
          onPressed: (position, size) {
            _menuDropdown.show(
              routes: [
                MenuDropdownOverlayRoutes(
                  name: 'Intro',
                  onPressed: () {
                    widget.onIntroPressed();
                  },
                  isActive: widget.activeButton == 1,
                ),
                MenuDropdownOverlayRoutes(
                  name: 'About',
                  onPressed: () {
                    widget.onAboutPressed();
                  },
                  isActive: widget.activeButton == 2,
                ),
                MenuDropdownOverlayRoutes(
                  name: 'Portfolio',
                  onPressed: () {
                    widget.onPortfolioPressed();
                  },
                  isActive: widget.activeButton == 3,
                ),
                MenuDropdownOverlayRoutes(
                  name: 'Get in touch',
                  onPressed: () {
                    widget.onGetInTouchPressed();
                  },
                  isActive: widget.activeButton == 4,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  //----------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return CustomField(
      width: double.infinity,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ResponsiveScreenAdapter(
          fallbackScreen: _buildHeader(context),
          screenDesktop: _buildHeader(context, isDesktopScreen: true),
          screenTablet: _buildHeaderOnTabletMobile(context),
          screenMobile: _buildHeaderOnTabletMobile(context),
        ),
      ],
    );
  }
}
