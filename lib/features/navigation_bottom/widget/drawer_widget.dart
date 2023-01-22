import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/circle_image_widget.dart';
import '../../../core/widgets/list_tile.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key, required this.closeDrawer}) : super(key: key);
  final VoidCallback closeDrawer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 81),
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(6.0),
              //   child: Align(
              //       alignment: Alignment.centerRight,
              //       child: IconButton(
              //         icon: const Icon(Icons.close),
              //         onPressed: closeDrawer,
              //       )),
              // ),
              DecoratedBox(
                decoration:  const BoxDecoration(


                  image:  DecorationImage(

                      image: AssetImage(ImageAssets.darwarBack),

                      fit: BoxFit.fill),


                ),
                child: Container(
                    decoration: new BoxDecoration(color: AppColors.grayLite2.withOpacity(0.80)),
                    height: 180,
                    width: double.maxFinite,
                    child: Expanded(
                      child: Column(
                        children: [
                          Expanded(flex: 1, child: Container()),
                          const CircleImageWidget(width: 80, height: 80),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "hesham",
                            style: TextStyle(
                                fontSize: 17,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(flex: 3, child: Container()),
                        ],
                      ),
                    )),
              ),

              MyListTile(
                image: ImageAssets.switchicon,
                text: 'switch_account'.tr(),
                onClick: () => Navigator.pop(context),
              ),
              Divider(
                  color: AppColors.grey4
              ),
              const SizedBox(
                height: 6,
              ) ,
              MyListTile(
                image: ImageAssets.carmangicon,
                text: 'car_mang'.tr(),
                onClick: () => Navigator.pop(context),
              ),
              Divider(
                  color: AppColors.grey4
              ),
              const SizedBox(
                height: 6,
              ),
              MyListTile(
                image: ImageAssets.walleticon,
                text: 'wallet'.tr(),
                onClick: () => Navigator.pop(context),
              ),
              Divider(
                  color: AppColors.grey4
              ),
              const SizedBox(
                height: 6,
              ),
              MyListTile(
                image: ImageAssets.settingicon,
                text: 'settings'.tr(),
                onClick: () => Navigator.pop(context),
              ),
              Divider(
                  color: AppColors.grey4
              ),
              const SizedBox(
                height: 6,
              ),
              MyListTile(
                image: ImageAssets.supporticon,
                text: 'support'.tr(),
                onClick: () => Navigator.pop(context),
              ),
              Divider(
                  color: AppColors.grey4
              ),
              const SizedBox(
                height: 6,
              ),
              MyListTile(
                image: ImageAssets.touricon,
                text: 'tour_guide'.tr(),
                onClick: () => Navigator.pop(context),
              ),
              Divider(
                  color: AppColors.grey4
              ),
              const SizedBox(
                height: 6,
              ),
              MyListTile(
                image: ImageAssets.logouticon,
                text: 'logout'.tr(),
                onClick: () => Navigator.pop(context),
              ),
              Divider(
                  color: AppColors.grey5
              ),
              const SizedBox(
                height: 6,
              )

            ],
          ),
        ),
      ),
    );
  }
}
