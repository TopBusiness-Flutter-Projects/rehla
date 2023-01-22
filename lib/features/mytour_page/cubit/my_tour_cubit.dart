
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/features/offer_ride/models/offer_ride_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'my_tour_state.dart';

class MyTourCubit extends Cubit<MyTourState> {
  MyTourCubit() : super(MyTourInitial()){
    getAllSavedOffers();
  }


  OfferRideModel? offerRideModel;
  List<OfferRideModel>? offerRideModelList;

  getAllSavedOffers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getStringList('offerRide')!.toList());
    // Map<String, dynamic> carMap = jsonDecode(prefs.getStringList('offerRide')!.first);
    // offerRideModel = OfferRideModel.fromJson(carMap);

    offerRideModelList?.addAll(List<OfferRideModel>.from(json.decode(prefs.getStringList('offerRide')).map((x) => OfferRideModel.fromJson(x))));

    print('-------------------------------------------------');
    print(offerRideModel!.toJson());
    // print(offerRideModel!.date);
    // print(offerRideModel!.startTime);
    // print(offerRideModel!.endTime);
    // print(offerRideModel!.startLocation);
    // print(offerRideModel!.endLocation);
    // print(offerRideModel!.numberOfSeats);
    // print(offerRideModel!.expectedDistance);
    print('-------------------------------------------------');
    emit(MyTourGetAllOffersRides());
  }


}
