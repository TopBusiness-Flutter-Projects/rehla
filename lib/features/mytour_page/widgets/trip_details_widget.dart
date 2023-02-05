import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../../offer_ride/models/offer_ride_model.dart';

class TripDetailsWidget extends StatelessWidget {
  const TripDetailsWidget({Key? key, required this.offerRideModel}) : super(key: key);
  final OfferRideModel offerRideModel;

  @override
  Widget build(BuildContext context) {
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'trip_details'.tr(),
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 22,
            ),
          ),
          Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 32,
                          width: 32,
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                'start_location'.tr(),
                              ),
                              const SizedBox(height: 8),
                              Text(offerRideModel.startLocation!),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 32,
                          width: 32,
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                'end_location'.tr(),
                              ),
                              const SizedBox(height: 8),
                              Text(offerRideModel.endLocation!),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 22,
                  left: lang == 'en' ? 32 : null,
                  right: lang == 'ar' ? 32 : 0,
                  child: SizedBox(
                    height: 148,
                    child: Column(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.primary,
                          ),
                        ),
                        Container(
                          color: AppColors.black,
                          width: 1,
                          height: 80,
                        ),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                MySvgWidget(
                  path: ImageAssets.dateIcon,
                  height: 32,
                  width: 32,
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date'.tr(),
                      ),
                      const SizedBox(height: 8),
                      Text(offerRideModel.date!),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                MySvgWidget(
                  path: ImageAssets.timeIcon,
                  height: 32,
                  width: 32,
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time'.tr(),
                      ),
                      const SizedBox(height: 8),
                      Text(offerRideModel.startTime!),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                MySvgWidget(
                  path: ImageAssets.distanceIcon,
                  height: 32,
                  width: 32,
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Distance'.tr(),
                      ),
                      const SizedBox(height: 8),
                      Text('${offerRideModel.expectedDistance}'),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                MySvgWidget(
                  path: ImageAssets.seatIcon,
                  height: 32,
                  width: 32,
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Available Seats'.tr(),
                      ),
                      const SizedBox(height: 8),
                      Text('${offerRideModel.numberOfSeats}'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
