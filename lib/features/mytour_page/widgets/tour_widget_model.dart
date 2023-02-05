import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_button.dart';
import '../../offer_ride/models/offer_ride_model.dart';
import 'icon_card_widget.dart';

class TourModel extends StatelessWidget {
  const TourModel({
    Key? key,
    required this.offerRideModel,
    required this.startTrip,
    required this.endTrip,
    required this.closeTrip,
    required this.detailsTrip,
  }) : super(key: key);
  final OfferRideModel offerRideModel;
  final VoidCallback startTrip;
  final VoidCallback endTrip;
  final VoidCallback closeTrip;
  final VoidCallback detailsTrip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            left: 12,
                            right: 12,
                          ),
                          child: SizedBox(
                            height: 50,
                            child: Column(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.primary,
                                  ),
                                ),
                                Container(
                                  color: AppColors.black,
                                  width: 1,
                                  height: 20,
                                ),
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offerRideModel.startLocation ?? '',
                                overflow: TextOverflow.clip,
                              ),
                              Text(
                                offerRideModel.endLocation ?? '',
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        IconCardWidget(
                            imagePath: ImageAssets.dateIcon,
                            title: 'Date'.tr(),
                            titleValue: offerRideModel.date!),
                        IconCardWidget(
                            imagePath: ImageAssets.timeIcon,
                            title: 'Time'.tr(),
                            titleValue: offerRideModel.startTime!),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconCardWidget(
                            imagePath: ImageAssets.distanceIcon,
                            title: 'Distance'.tr(),
                            titleValue:
                                offerRideModel.expectedDistance.toString()),
                        IconCardWidget(
                            imagePath: ImageAssets.seatIcon,
                            title: 'Available Seats'.tr(),
                            titleValue:
                                offerRideModel.numberOfSeats.toString()),
                      ],
                    ),
                    offerRideModel.status != 2
                        ? Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  text: offerRideModel.status == 0
                                      ? 'Start Trip'.tr()
                                      : 'End Trip'.tr(),
                                  onClick: () {
                                    if (offerRideModel.status == 0) {
                                      startTrip();
                                    } else if (offerRideModel.status == 1) {
                                      endTrip();
                                    }
                                  },
                                  color: AppColors.primary,
                                  paddingHorizontal: 8,
                                ),
                              ),
                              offerRideModel.status == 0
                                  ? Expanded(
                                      child: CustomButton(
                                        text: 'Close Trip'.tr(),
                                        onClick: () => closeTrip(),
                                        color: AppColors.error,
                                        paddingHorizontal: 8,
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          )
                        : const SizedBox(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: 'Details'.tr(),
                            onClick: () => detailsTrip(),
                            color: AppColors.blue,
                            paddingHorizontal: 8,
                          ),
                        ),
                        offerRideModel.status != 2
                            ? Expanded(
                                child: CustomButton(
                                  text: 'Bookings'.tr(),
                                  onClick: () {},
                                  color: AppColors.yellow,
                                  paddingHorizontal: 8,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 7,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    width: 50,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: offerRideModel.status == 0
                          ? AppColors.yellow
                          : AppColors.primary,
                    ),
                    child: Transform.rotate(
                      angle: math.pi / 2,
                      child: Center(
                        child: Text(
                          offerRideModel.status == 0
                              ? 'Waiting'.tr()
                              : offerRideModel.status == 1
                                  ? 'Start'.tr()
                                  : 'End'.tr(),
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
