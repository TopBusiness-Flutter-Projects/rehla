
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../mytour_page/widgets/tour_driver_widget.dart';
import '../../mytour_page/widgets/trip_details_widget.dart';
import '../../mytour_page/widgets/trip_driver_structures_widget.dart';
import '../../mytour_page/widgets/trip_map_widget.dart';
import '../../mytour_page/widgets/trip_passenger_widget.dart';
import '../../mytour_page/widgets/trip_price_details_widget.dart';
import '../../offer_ride/models/offer_ride_model.dart';
import '../cubit/details_cubit.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({Key? key, required this.offerRideModel}) : super(key: key);

  final OfferRideModel offerRideModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('trip_details'.tr()),
        elevation: 0,
        backgroundColor: AppColors.primary,
      ),
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                TourDriverWidget(offerRideModel: offerRideModel),
                Divider(
                  height: 5,
                  color: AppColors.whiteLite,
                  thickness: 4,
                ),
                TripDetailsWidget(offerRideModel: offerRideModel),
                Divider(
                  height: 5,
                  color: AppColors.whiteLite,
                  thickness: 4,
                ),
                const TripMapWidget(),
                Divider(
                  height: 5,
                  color: AppColors.whiteLite,
                  thickness: 4,
                ),
                const TripDriverStructureWidget(),
                Divider(
                  height: 5,
                  color: AppColors.whiteLite,
                  thickness: 4,
                ),
                const TripPassengerWidget(),
                Divider(
                  height: 5,
                  color: AppColors.whiteLite,
                  thickness: 4,
                ),
                TripPriceDetailsWidget(offerRideModel: offerRideModel),
                Divider(
                  height: 5,
                  color: AppColors.whiteLite,
                  thickness: 4,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
