import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/core/utils/app_strings.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../cubit/navigator_bottom_cubit.dart';

class NavigatorBottomWidget extends StatelessWidget {
  NavigatorBottomWidget({Key? key}) : super(key: key);
  late int _page = 2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorBottomCubit, NavigatorBottomState>(
      builder: (context, state) {
        _page = context.read<NavigatorBottomCubit>().page;
        return CurvedNavigationBar(
          index: 2,
          height: 60.0,
          items: [
            _page != 0
                ? SizedBox(
              height: 50,
                    child: Column(
                      children: [
                        MySvgWidget(
                          path: ImageAssets.profileicon,
                          color: AppColors.primary,
                          width: 24,
                          height: 24,
                        ),
                        Text("profile".tr(),
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 10,
                            ))
                      ],
                    ),
                  )
                : MySvgWidget(
                    path: ImageAssets.profileicon,
                    color: AppColors.white,
                    width: 24,
                    height: 24,
                  ),
            _page != 1
                ? SizedBox(
              height: 50,
                    child: Column(
                      children: [
                        MySvgWidget(
                          path: ImageAssets.tour_guideicon,
                          color: AppColors.primary,
                          width: 24,
                          height: 24,
                        ),
                        Text("my_tour".tr(),
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 10,
                            ))
                      ],
                    ),
                  )
                : MySvgWidget(
                    path: ImageAssets.tour_guideicon,
                    color: AppColors.white,
                    width: 24,
                    height: 24,
                  ),
            _page != 2
                ? SizedBox(
              height: 50,
                    child: Column(
                      children: [
                        MySvgWidget(
                          path: ImageAssets.homeicon,
                          color: AppColors.primary,
                          width: 24,
                          height: 24,
                        ),
                        Text("home".tr(),
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 10,
                            ))
                      ],
                    ),
                  )
                : MySvgWidget(
                    path: ImageAssets.homeicon,
                    color: AppColors.white,
                    width: 24,
                    height: 24,
                  ),
            _page != 3
                ? SizedBox(
              height: 50,
                    child: Column(
                      children: [
                        MySvgWidget(
                          path: ImageAssets.caricon,
                          color: AppColors.primary,
                          width: 24,
                          height: 24,
                        ),
                        Text("orders".tr(),
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 10,
                            ))
                      ],
                    ),
                  )
                : MySvgWidget(
                    path: ImageAssets.caricon,
                    color: AppColors.white,
                    width: 24,
                    height: 24,
                  ),
            _page != 4
                ? SizedBox(
                    height: 50,
                    child: Column(
                      children: [
                        MySvgWidget(
                          path: ImageAssets.notificationsicon,
                          color: AppColors.primary,
                          width: 24,
                          height: 24,
                        ),
                        Text("notification".tr(),
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 10,
                            ))
                      ],
                    ),
                  )
                : MySvgWidget(
                    path: ImageAssets.notificationsicon,
                    color: AppColors.white,
                    width: 24,
                    height: 24,
                  ),
          ],
          color: Colors.white,
          buttonBackgroundColor: AppColors.primary,
          backgroundColor: AppColors.scaffoldBackground,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          onTap: (index) {
            context.read<NavigatorBottomCubit>().changePage(index);
          },
          letIndexChange: (index) => true,
        );
      },
    );
  }
}
