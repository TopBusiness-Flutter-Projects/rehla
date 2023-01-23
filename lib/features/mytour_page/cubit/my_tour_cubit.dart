import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/features/offer_ride/models/offer_ride_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/toast_message_method.dart';
import '../../offer_ride/models/list_of_offer_ride_model.dart';

part 'my_tour_state.dart';

class MyTourCubit extends Cubit<MyTourState> {
  MyTourCubit() : super(MyTourInitial()) {
    getAllSavedOffers();
  }

  OfferRideModel? offerRideModel;
  List<OfferRideModel> offerRideModelList = [];

  getAllSavedOffers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    OfferRideListModel offerRideListModel = OfferRideListModel([]);
    Map<String, dynamic> offerMap = jsonDecode(prefs.getString('offerRide')!);
    offerRideListModel = OfferRideListModel.fromJson(offerMap);
    offerRideModelList = offerRideListModel.offerRide;
    emit(MyTourGetAllOffersRides());
  }

  deleteTrip(int index, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    offerRideModelList.removeAt(index);
    OfferRideListModel offerRideListModel =
        OfferRideListModel(offerRideModelList);
    await prefs
        .setString('offerRide', jsonEncode(offerRideListModel))
        .then((value) {
      getAllSavedOffers();
      toastMessage(
        'Trip Ended Successfully'.tr(),
        context,
        color: AppColors.success,
        duration: 300,
      );
    });
  }
}
