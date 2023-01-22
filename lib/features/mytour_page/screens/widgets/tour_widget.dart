import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';

class TourWidget extends StatelessWidget {
  const TourWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      SvgPicture.asset(
        ImageAssets.sadicon,
        height: 150,
        width: 150,
        color: AppColors.grey1,
      ),
      SizedBox(
        height: 20,
      ),
      Center(
        child: Text(
          'No Trip Found'.tr(),
          style: TextStyle(fontSize: 14, color: AppColors.grey1),
        ),
      )
    ],);
  }
}
