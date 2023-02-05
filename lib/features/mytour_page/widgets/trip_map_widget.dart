import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../../../core/utils/app_colors.dart';

class TripMapWidget extends StatelessWidget {
  const TripMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String lang = EasyLocalization.of(context)!.locale.languageCode;
    return InkWell(
      onTap: (){
        MapsLauncher.launchCoordinates(
          21.385312,
          39.860004,
          'Rehla',
        );
      },
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        child: Row(
          children: [
            Icon(
              Icons.map_outlined,
              color: AppColors.primary,
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Text(
                  'تتبع الرحله على الخريطه',
                  style:
                  TextStyle(color: AppColors.primary, fontSize: 22),
                )),
            Icon(
              lang != 'en'
                  ? Icons.chevron_right_outlined
                  : Icons.chevron_left_outlined,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
