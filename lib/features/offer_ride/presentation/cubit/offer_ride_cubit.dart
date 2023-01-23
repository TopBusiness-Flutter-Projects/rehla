import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/core/utils/app_colors.dart';
import 'package:rehla/core/utils/toast_message_method.dart';
import 'package:rehla/features/offer_ride/models/offer_ride_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../add car/models/add_Car_model.dart';
import '../../models/list_of_offer_ride_model.dart';

part 'offer_ride_state.dart';

class OfferRideCubit extends Cubit<OfferRideState> {
  OfferRideCubit() : super(OfferRideInitial()) {
    getAllSavedCars();

    controller.text = 'information'.tr();
    startTime =
        '${DateTime.now().hour < 10 ? '0${DateTime.now().hour}' : DateTime.now().hour}:${DateTime.now().minute < 10 ? '0${DateTime.now().minute}' : DateTime.now().minute}:${DateTime.now().second < 10 ? '0${DateTime.now().second}' : DateTime.now().second}';
    print('startTime');
    print(startTime);
    date =
        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
  }

  int expectedDistance = 0;
  int expectedPrice = 0;
  int totalSeatPrice = 0;
  int seatPrice = 0;
  int numberOfSeats = 1;
  String selectedCar = '';
  String startTime = '';
  String? endTime;

  String date = '';
  String information = '';
  String? startLocation;
  String? endLocation;

  bool isStartLocationSelected = false;
  bool isPassenger = false;
  AddCarModel? addCarModel;
  TextEditingController controller = TextEditingController();

  selectCarLocation(int kind, BuildContext context) {
    if (kind == 1) {
      startLocation = 'الدرب الأحمر، Al Abageyah, El Khalifa';
      isStartLocationSelected = true;
      emit(OfferRideSelectLocation());
      Future.delayed(const Duration(milliseconds: 350), () {
        Navigator.pop(context);
      });
    } else {
      endLocation = 'خلف الجامع الأزهر، Haret Al Arbeaen, El-Darb El-Ahmar';
      expectedDistance = 50;
      expectedPrice = 102;
      totalSeatPrice = 102;
      seatPrice = 1;
      endTime =
          '${DateTime.now().hour < 10 ? '0${DateTime.now().hour}' : DateTime.now().hour}:${DateTime.now().minute + 30 < 10 ? '0${DateTime.now().minute + 30}' : DateTime.now().minute + 30}:${DateTime.now().second < 10 ? '0${DateTime.now().second}' : DateTime.now().second}';
      emit(OfferRideSelectLocation());
      Future.delayed(const Duration(milliseconds: 350), () {
        Navigator.pop(context);
      });
    }
  }

  getAllSavedCars() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> carMap = jsonDecode(prefs.getString('addCar')!);
    addCarModel = AddCarModel.fromJson(carMap);
    selectedCar = addCarModel!.carModelContent!;
    emit(OfferRideGetAllCars());
  }

  changePassenger() {
    isPassenger = !isPassenger;
    emit(OfferRidePassengerChanged());
  }

  increaseData(String type, BuildContext context) {
    if (type == 'price') {
      totalSeatPrice = totalSeatPrice + 1;
      seatPrice = seatPrice + 1;
      emit(OfferRideIncrease());
    } else {
      if (numberOfSeats < 4) {
        numberOfSeats = numberOfSeats + 1;
        emit(OfferRideIncrease());
      } else {
        toastMessage(
          'this_is_the_maximum_number_allowed'.tr(),
          context,
          color: AppColors.black,
        );
      }
    }
  }

  decreaseData(String type, BuildContext context) {
    if (type == 'price') {
      if (seatPrice <= 1) {
        toastMessage(
          'must_be_greater_than_zero'.tr(),
          context,
          color: AppColors.black,
        );
      } else {
        totalSeatPrice = totalSeatPrice - 1;
        seatPrice = seatPrice - 1;
        emit(OfferRideDecrease());
      }
    } else {
      if (numberOfSeats > 1) {
        numberOfSeats = numberOfSeats - 1;
        emit(OfferRideDecrease());
      } else {
        toastMessage(
          'must_be_greater_than_zero'.tr(),
          context,
          color: AppColors.black,
        );
      }
    }
  }

  saveOfferRideData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    OfferRideModel offerRideModel = OfferRideModel(
      startLocation: startLocation,
      endLocation: endLocation,
      startTime: startTime,
      endTime: endTime,
      date: date,
      expectedDistance: expectedDistance,
      expectedPrice: expectedPrice,
      totalSeatPrice: totalSeatPrice,
      numberOfSeats: numberOfSeats,
      selectedCar: selectedCar,
      isPassenger: isPassenger,
      information: controller.text,
    );
    OfferRideListModel offerRideListModel = OfferRideListModel([]);
    if (prefs.getString('offerRide') != null) {
      Map<String, dynamic> offerMap = jsonDecode(prefs.getString('offerRide')!);
      offerRideListModel = OfferRideListModel.fromJson(offerMap);
      offerRideListModel.offerRide.add(offerRideModel);
      await prefs
          .setString('offerRide', jsonEncode(offerRideListModel))
          .then((value) {
        Navigator.pop(context);
        toastMessage(
          'trip_created_successfully'.tr(),
          context,
          color: AppColors.success,
          duration: 300,
        );
      });
    } else {
      offerRideListModel.offerRide.add(offerRideModel);
      await prefs
          .setString('offerRide', jsonEncode(offerRideListModel))
          .then((value) {
        Navigator.pop(context);
        toastMessage(
          'trip_created_successfully'.tr(),
          context,
          color: AppColors.success,
          duration: 300,
        );
      });
    }
  }
}
