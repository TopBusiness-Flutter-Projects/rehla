import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rehla/core/utils/app_colors.dart';
import 'package:rehla/core/utils/assets_manager.dart';

import '../../../../core/widgets/circle_image_widget.dart';
import '../widgets/listTileWidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3 - 70,
          width: MediaQuery.of(context).size.width,
          color: AppColors.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CircleImageWidget(width: 80, height: 80),
              const SizedBox(height: 18),
              Text(
                "hesham",
                style: TextStyle(
                    fontSize: 17,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  side: BorderSide(width: 2.0, color: AppColors.white),
                ),
                child: Text(
                  'Edit Profile'.tr(),
                  style: TextStyle(color: AppColors.white),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
         ListTailWidget(
          title: 'Rating'.tr(),
          imagePath: ImageAssets.rattingIcon,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: AppColors.grey1,
        ),
         ListTailWidget(
          title: 'Preference'.tr(),
          imagePath: ImageAssets.preferenceIcon,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: AppColors.grey1,
        ),
         ListTailWidget(
          title: 'Identity Card'.tr(),
          imagePath: ImageAssets.identityIcon,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: AppColors.grey1,
        ),
         ListTailWidget(
          title: 'Verification'.tr(),
          imagePath: ImageAssets.verificationIcon,
        ),
      ],
    );
  }
}
