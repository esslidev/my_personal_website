import 'package:ali_ess_website/features/presentation/screens/dashboard/components/introduction.dart';
import 'package:flutter/material.dart';

import '../../../../core/enums/app_enums.dart';
import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../widgets/common/custom_field.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late ResponsiveSizeAdapter R;

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return CustomField(
      arrangement: FieldArrangement.column,
      minHeight: screenHeight - screenHeight / 5,
      padding:
          EdgeInsets.symmetric(vertical: R.size(50), horizontal: R.size(150)),
      children: const [IntroductionComponent()],
    );
  }
}
