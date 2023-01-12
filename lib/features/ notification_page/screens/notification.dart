import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/list_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Center(
        child: ListView(shrinkWrap: true, children: [
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
              'No Notifications Found'.tr(),
              style: TextStyle(fontSize: 14, color: AppColors.grey1),
            ),
          )
        ]),
      ),
    );
  }
}
