import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/my_svg_widget.dart';

class TripDriverStructureWidget extends StatelessWidget {
  const TripDriverStructureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'driver_details'.tr(),
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MySvgWidget(
                  path: ImageAssets.oneIcon,
                  width: 32,
                  height: 32,
                ),
                MySvgWidget(
                  path: ImageAssets.twoIcon,
                  width: 32,
                  height: 32,
                ),
                MySvgWidget(
                  path: ImageAssets.threeIcon,
                  width: 32,
                  height: 32,
                ),
                MySvgWidget(
                  path: ImageAssets.fourIcon,
                  width: 32,
                  height: 32,
                ),
                MySvgWidget(
                  path: ImageAssets.sixIcon,
                  width: 32,
                  height: 32,
                ),
                MySvgWidget(
                  path: ImageAssets.fiveIcon,
                  width: 32,
                  height: 32,
                ),
                MySvgWidget(
                  path: ImageAssets.sevenIcon,
                  width: 32,
                  height: 32,
                ),
                MySvgWidget(
                  path: ImageAssets.eightIcon,
                  width: 32,
                  height: 32,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
