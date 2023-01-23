import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/core/utils/assets_manager.dart';
import 'package:rehla/core/widgets/custom_button.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/offer_ride_cubit.dart';

class MapImageWidget extends StatelessWidget {
  const MapImageWidget({Key? key, required this.kind}) : super(key: key);
  final int kind;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kind==1?'set_start_location'.tr():'set_end_location'.tr(),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Stack(
        children: [
          Image.asset(
            kind != 1 ? ImageAssets.map2 : ImageAssets.map1,
            height: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: CustomButton(
              onClick: () =>context.read<OfferRideCubit>().selectCarLocation(kind,context),
              text: 'select_this_location'.tr(),
              color: AppColors.primary,
              paddingHorizontal: 80,
            ),
          )
        ],
      ),
    );
  }
}
