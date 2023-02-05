import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/add car/models/add_Car_model.dart';
import '../../features/offer_ride/models/list_of_offer_ride_model.dart';
import '../../features/offer_ride/models/offer_ride_model.dart';

class Preferences {
  static final Preferences instance = Preferences._internal();

  Preferences._internal();

  factory Preferences() => instance;

  Future<void> saveOfferRideData(OfferRideModel offerRideModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    OfferRideListModel offerRideListModel =
        OfferRideListModel(offerRide: [], lastOfferRide: []);
    if (preferences.getString('offerRide') != null) {
      offerRideListModel = await getAllSavedOffers();
      offerRideListModel.offerRide!.add(offerRideModel);
      await preferences.setString('offerRide', jsonEncode(offerRideListModel));
    } else {
      offerRideListModel.offerRide!.add(offerRideModel);
      await preferences.setString('offerRide', jsonEncode(offerRideListModel));
    }
  }

  Future<void> saveCarData(AddCarModel addCarModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('addCar', jsonEncode(addCarModel));
  }

  Future<OfferRideListModel> getAllSavedOffers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    OfferRideListModel offerRideListModel = OfferRideListModel();
    if (preferences.getString('offerRide') != null) {
      Map<String, dynamic> offerMap =
          jsonDecode(preferences.getString('offerRide')!);
      offerRideListModel = OfferRideListModel.fromJson(offerMap);
    }
    return offerRideListModel;
  }

  Future<AddCarModel> getAllSavedCars() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AddCarModel carModel = AddCarModel();
    if (preferences.getString('addCar') != null) {
      Map<String, dynamic> offerMap =
          jsonDecode(preferences.getString('addCar')!);
      carModel = AddCarModel.fromJson(offerMap);
    }
    return carModel;
  }

  saveTripDriversAndPassengers(
      {required int index, required OfferRideModel offerRideModel}) async {
    print('*********************************');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    OfferRideListModel offerRideListModel = await getAllSavedOffers();
    offerRideListModel.offerRide![index] = offerRideModel;
    // print(offerRideListModel.offerRide![index].toJson());
    print(offerRideModel.toJson());
    print(offerRideListModel.offerRide![index].toJson());
    await preferences
        .setString('offerRide', jsonEncode(offerRideListModel));
  }


  Future<void> deleteTrip(OfferRideListModel offerRideListModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('offerRide', jsonEncode(offerRideListModel));
  }

  clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('user');
  }

  Future<void> changeTripStatus(
      {required int index, required int status}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    OfferRideListModel offerRideListModel = await getAllSavedOffers();
    if (status == 2) {
      offerRideListModel.offerRide![index].status = status;
      offerRideListModel.lastOfferRide!
          .add(offerRideListModel.offerRide![index]);
      offerRideListModel.offerRide!.removeAt(index);
      await preferences.setString('offerRide', jsonEncode(offerRideListModel));
    } else {
      offerRideListModel.offerRide![index].status = status;
      await preferences.setString('offerRide', jsonEncode(offerRideListModel));
    }
  }

  clearCartData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('cart');
  }
}
