import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rehla/features/mytour_page/cubit/my_tour_cubit.dart';
import 'dart:math' as math;

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_button.dart';
import 'icon_card_widget.dart';

class TourWidget extends StatelessWidget {
  const TourWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTourCubit, MyTourState>(
      builder: (context, state) {
        MyTourCubit cubit = context.read<MyTourCubit>();
        return cubit.offerRideModelList.isEmpty
            ? RefreshIndicator(
                onRefresh: () async {
                  cubit.getAllSavedOffers();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.sadicon,
                      height: 150,
                      width: 150,
                      color: AppColors.grey1,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        'No Trip Found'.tr(),
                        style: TextStyle(fontSize: 14, color: AppColors.grey1),
                      ),
                    )
                  ],
                ),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  cubit.getAllSavedOffers();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      ...List.generate(cubit.offerRideModelList.length, (index) => Padding(
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
                                                      borderRadius:
                                                      BorderRadius.circular(50),
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
                                                      borderRadius:
                                                      BorderRadius.circular(50),
                                                      color: AppColors.orange,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cubit.offerRideModelList[index]
                                                      .startLocation??'',
                                                  overflow: TextOverflow.clip,
                                                ),
                                                Text(
                                                  cubit
                                                      .offerRideModelList[index].endLocation??'',
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
                                              titleValue:
                                              cubit.offerRideModelList[index].date!),
                                          IconCardWidget(
                                              imagePath: ImageAssets.timeIcon,
                                              title: 'Time'.tr(),
                                              titleValue:
                                              cubit.offerRideModelList[index].startTime!),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          IconCardWidget(
                                              imagePath: ImageAssets.distanceIcon,
                                              title: 'Distance'.tr(),
                                              titleValue: cubit
                                                  .offerRideModelList[index].expectedDistance
                                                  .toString()),
                                          IconCardWidget(
                                              imagePath: ImageAssets.seatIcon,
                                              title: 'Available Seats'.tr(),
                                              titleValue: cubit
                                                  .offerRideModelList[index].numberOfSeats
                                                  .toString()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomButton(
                                              text: 'Start Trip'.tr(),
                                              onClick: () {},
                                              color: AppColors.primary,
                                              paddingHorizontal: 8,
                                            ),
                                          ),
                                          Expanded(
                                            child: CustomButton(
                                              text: 'End Trip'.tr(),
                                              onClick: () =>cubit.deleteTrip(index, context),
                                              color: AppColors.error,
                                              paddingHorizontal: 8,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomButton(
                                              text: 'Details'.tr(),
                                              onClick: () {},
                                              color: AppColors.blue,
                                              paddingHorizontal: 8,
                                            ),
                                          ),
                                          Expanded(
                                            child: CustomButton(
                                              text: 'Bookings'.tr(),
                                              onClick: () {},
                                              color: AppColors.yellow,
                                              paddingHorizontal: 8,
                                            ),
                                          ),
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
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                      width: 50,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: AppColors.yellow),
                                      child: Transform.rotate(
                                        angle: math.pi / 2,
                                        child: Center(
                                          child: Text(
                                            'Waiting'.tr(),
                                            style:
                                            TextStyle(color: AppColors.white),
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
                      ))

                    ],
                  ),
                ),
              );
      },
    );
  }
}
