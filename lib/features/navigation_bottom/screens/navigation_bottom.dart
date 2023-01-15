import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rehla/core/utils/app_colors.dart';
import 'package:rehla/core/utils/assets_manager.dart';
import 'package:rehla/features/navigation_bottom/screens/widgets/drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../ notification_page/screens/notification.dart';
import '../../home_page/screens/home_page.dart';
import '../../my_orders_page/screens/myorders_page.dart';
import '../../mytour_page/screens/mytour_page.dart';
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

    return Scaffold(
      appBar: AppBar(

        backgroundColor: AppColors.primary,
        elevation: 0,
         flexibleSpace:
         Container(
           margin: EdgeInsets.only(top: 20),
         child: Align(
             alignment: Alignment.centerRight,
             
             child:Padding( 
               padding: EdgeInsets.all(20),
                 child: SvgPicture.asset(
            ImageAssets.messageicon,
            color: AppColors.white,
            width: 24,
            height: 24,
          ))))
      ),
      drawer: DrawerWidget(closeDrawer: () {
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

             return HomePageScreen();
           }
           else  if (context.read<NavigatorBottomCubit>().page == 1) {

             return MyTourScreen();
           }   else  if (context.read<NavigatorBottomCubit>().page == 3) {

             return MyOrdersScreen();
           }

           else  if (context.read<NavigatorBottomCubit>().page == 4) {

             return NotificationScreen();
           }
           else {
             return Container();
           }
           // else if (context.read<NavigatorBottomCubit>().page == 1) {
           //   return CalenderScreen();
           //  } else if (context.read<NavigatorBottomCubit>().page == 2) {
           //    return Container(color: AppColors.color1,);
           //  } else {
           //    return DrawerWidget();

          },
        ));
  }
}
