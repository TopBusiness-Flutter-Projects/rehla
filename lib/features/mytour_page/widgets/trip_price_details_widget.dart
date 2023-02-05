import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../offer_ride/models/offer_ride_model.dart';

class TripPriceDetailsWidget extends StatelessWidget {
  const TripPriceDetailsWidget({Key? key, required this.offerRideModel}) : super(key: key);
  final OfferRideModel offerRideModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'seat_price'.tr(),
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 25),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('trip_price'.tr()),
                    Text(
                      '${offerRideModel.expectedPrice}',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('gover_price'.tr()),
                    Text(
                      '-0.50',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('airport_price'.tr()),
                    Text(
                      '-0.00',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('app_price'.tr()),
                    Text(
                      '-1.25',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('copon'.tr()),
                    Text(
                      '+0.00',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('vate'.tr()),
                    Text(
                      '-2.52',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(
                    height: 5,
                    color: AppColors.whiteLite,
                    thickness: 4,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('capten_price'.tr()),
                    Text(
                      '${(offerRideModel.expectedPrice!) - 4.27}',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
