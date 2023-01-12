import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rehla/core/utils/app_colors.dart';
import 'package:rehla/features/mytour_page/screens/widgets/tour_widget.dart';

class MyTourScreen extends StatelessWidget {
  const MyTourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: AppColors.primary,
          flexibleSpace: Container(
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
        body: const TabBarView(
          children: [
            TourWidget(),
            TourWidget(),
          ],
        ),
      ),
    );
  }
}
