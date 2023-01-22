import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rehla/core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../mytour_page/widgets/tour_widget.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          flexibleSpace: SizedBox(
            height: double.maxFinite,
            child: TabBar(
              indicatorColor: AppColors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  text: 'next tour'.tr(),
                ),
                Tab(
                  text: 'Previous tour'.tr(),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ImageAssets.cancelIcon,
                              width: 16,
                              height: 16,
                              color: AppColors.grey1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ImageAssets.filterIcon,
                              width: 16,
                              height: 16,
                              color: AppColors.grey1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 40,
              child: const TabBarView(
                children: [
                  TourWidget(),
                  TourWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
