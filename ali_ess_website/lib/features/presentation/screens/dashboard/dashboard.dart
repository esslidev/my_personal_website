import 'package:ali_ess_website/features/presentation/widgets/common/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/enums/app_enums.dart';
import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../widgets/common/custom_field.dart';
import '../home/components/header.dart';

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
    return CustomField(
      height: 2000,
      arrangement: FieldArrangement.column,
      padding:
          EdgeInsets.symmetric(vertical: R.size(50), horizontal: R.size(150)),
      children: const [],
    );
  }
}
