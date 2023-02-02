import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rehla/features/mytour_page/cubit/my_tour_cubit.dart';
import 'package:rehla/features/mytour_page/widgets/tour_widget_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';

class TourWidget extends StatefulWidget {
  const TourWidget({Key? key, required this.status}) : super(key: key);
  final int status;

  @override
  State<TourWidget> createState() => _TourWidgetState();
}

class _TourWidgetState extends State<TourWidget> {
  @override
  void initState() {
    super.initState();
    context.read<MyTourCubit>().getAllSavedOffers();
  }

  @override
  Widget build(BuildContext context) {
    print('widget.status');
    print(widget.status);
    return BlocBuilder<MyTourCubit, MyTourState>(
      builder: (context, state) {
        MyTourCubit cubit = context.read<MyTourCubit>();
        return (widget.status == 1
                ? cubit.offerRideModelList.isEmpty
                : cubit.lastOfferRideModelList.isEmpty)
            ? RefreshIndicator(
                onRefresh: () async {
                  cubit.getAllSavedOffers();
                },
                child: ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3 +
                          MediaQuery.of(context).size.height / 3,
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
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.grey1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  cubit.getAllSavedOffers();
                },
                child: ListView(
                  children: [
                    ...List.generate(
                      widget.status == 1
                          ? cubit.offerRideModelList.length
                          : cubit.lastOfferRideModelList.length,
                      (index) {
                        // print('cubit.offerRideModelList[index].toJson()');
                        // print(cubit.offerRideModelList[index].toJson());
                        // print('cubit.lastOfferRideModelList[index].toJson()');
                        // // print(cubit.lastOfferRideModelList[index].toJson());
                        return widget.status == 1
                          ? TourModel(
                              offerRideModel: cubit.offerRideModelList[index],
                              startTrip: () {
                                cubit.changeTripStatus(
                                  index: index,
                                  status: 1,
                                );
                              },
                              endTrip: () {
                                cubit.changeTripStatus(
                                  index: index,
                                  status: 2,
                                );
                              },
                              closeTrip: () {
                                cubit.deleteTrip(
                                  index,
                                  context,
                                );
                              })
                          : TourModel(
                              offerRideModel:
                                  cubit.lastOfferRideModelList[index],
                              startTrip: () {
                                cubit.changeTripStatus(
                                  index: index,
                                  status: 1,
                                );
                              },
                              endTrip: () {
                                cubit.changeTripStatus(
                                  index: index,
                                  status: 2,
                                );
                              },
                              closeTrip: () {
                                cubit.deleteTrip(
                                  index,
                                  context,
                                );
                              });
                      },
                    )
                  ],
                ),
              );
      },
    );
  }
}
