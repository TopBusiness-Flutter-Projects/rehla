import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/list_tile.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 10, top: 10, bottom: 10),
                  child: Text(
                    "welcome".tr(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 10, bottom: 10),
                  child: Text(
                    'hesham',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                        color: AppColors.white),
                  ),
                )
              ],
            ),
            Expanded(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.grey7,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                        child: Card(
                          margin: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageAssets.map,
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Create a participatory journey".tr(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: Card(
                          margin: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageAssets.pin,
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: AppColors.color3,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text(
                                    "Secret registration".tr(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Vehicle class".tr(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                    ImageAssets.minusicon,
                                    color: AppColors.white,
                                    width: 30,
                                    height: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        child: Card(
                          margin: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [

                                SizedBox(
                                  width: 10,
                                ),

                                Text(
                                  "Unavailable".tr(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                child: Container(),
                                ),
                                Switch(value: false, onChanged: (value) {

                                },),
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  "available".tr(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
