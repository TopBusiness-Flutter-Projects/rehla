import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/circle_image_widget.dart';
import '../../../../core/widgets/list_tile.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({Key? key}) : super(key: key);


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
              'No Trip Found'.tr(),
              style: TextStyle(fontSize: 14, color: AppColors.grey1),
            ),
          )
        ]),
      ),
    );
  }
}
