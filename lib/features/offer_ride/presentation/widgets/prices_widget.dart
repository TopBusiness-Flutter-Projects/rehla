import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/features/add%20car/presentation/screens/add_car.dart';
import 'package:rehla/features/offer_ride/presentation/cubit/offer_ride_cubit.dart';

import '../../../../core/utils/app_colors.dart';

class PricesWidget extends StatelessWidget {
  const PricesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferRideCubit, OfferRideState>(
      builder: (context, state) {
        OfferRideCubit offerRideCubit = context.read<OfferRideCubit>();
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'expected_distance'.tr(),
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${offerRideCubit.expectedDistance}   ${'KM'.tr()} ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'expected_price'.tr(),
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${offerRideCubit.expectedPrice}   ${'SAR'.tr()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'total_seat_price'.tr(),
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${offerRideCubit.totalSeatPrice}   ${'SAR'.tr()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'set_seat_price'.tr(),
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () =>
                            offerRideCubit.decreaseData('price', context),
                        icon: Icon(
                          Icons.remove_circle_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Text(
                          '${offerRideCubit.seatPrice}   ${'SAR'.tr()}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            offerRideCubit.increaseData('price', context),
                        icon: Icon(
                          Icons.add_circle_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'set_number_of_seats'.tr(),
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () =>
                            offerRideCubit.decreaseData('seat', context),
                        icon: Icon(
                          Icons.remove_circle_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          '${offerRideCubit.numberOfSeats}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            offerRideCubit.increaseData('seat', context),
                        icon: Icon(
                          Icons.add_circle_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'select_car'.tr(),
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCarScreen(),
                          ),
                        ),
                        icon: Icon(
                          Icons.add,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            context.read<OfferRideCubit>().getAllSavedCars();
                          },
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 1,
                                color: AppColors.gray,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                offerRideCubit.selectedCar,
                                style: TextStyle(color: AppColors.gray),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'two_passengers_in_the_back_seat'.tr(),
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
                GestureDetector(
                  onTap: () => offerRideCubit.changePassenger(),
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: offerRideCubit.isPassenger
                          ? AppColors.primary
                          : AppColors.transparent,
                      border: Border.all(
                        width: 1,
                        color: offerRideCubit.isPassenger
                            ? AppColors.primary
                            : AppColors.gray,
                      ),
                      borderRadius: BorderRadius.circular(64),
                    ),
                    child: offerRideCubit.isPassenger
                        ? Icon(
                            Icons.check,
                            color: AppColors.white,
                          )
                        : Container(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
          ],
        );
      },
    );
  }
}
