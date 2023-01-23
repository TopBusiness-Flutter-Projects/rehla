import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rehla/core/utils/app_colors.dart';
import 'package:rehla/core/utils/assets_manager.dart';
import 'package:rehla/features/navigation_bottom/widget/drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ notification_page/screens/notification.dart';
import '../../home_page/screens/home_page.dart';
import '../../my_orders_page/screens/myorders_page.dart';
import '../../mytour_page/screens/mytour_page.dart';
import '../../profile/presentation/screens/profile.dart';
import '../cubit/navigator_bottom_cubit.dart';
import '../widget/navigator_bottom_widget.dart';

class NavigationBottom extends StatefulWidget {
  NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  //
  // shared() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  //   print('doooooooooooooooooooooooooooooooooooooooone');
  // }

  @override
  void initState() {
    // shared();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          flexibleSpace: Container(
            margin: const EdgeInsets.only(top: 40),
            child: Align(
              alignment:
                  lang == 'en' ? Alignment.centerRight : Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  ImageAssets.messageicon,
                  color: AppColors.white,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),
        drawer: DrawerWidget(
          closeDrawer: () {
            Navigator.pop(context);
          },
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: NavigatorBottomWidget(),
        ),
        body: BlocBuilder<NavigatorBottomCubit, NavigatorBottomState>(
          builder: (context, state) {
            if (context.read<NavigatorBottomCubit>().page == 2) {
              return const HomePageScreen();
            } else if (context.read<NavigatorBottomCubit>().page == 1) {
              return const MyTourScreen();
            } else if (context.read<NavigatorBottomCubit>().page == 3) {
              return const MyOrdersScreen();
            } else if (context.read<NavigatorBottomCubit>().page == 4) {
              return const NotificationScreen();
            } else {
              return const ProfileScreen();
            }
          },
        ));
  }
}
