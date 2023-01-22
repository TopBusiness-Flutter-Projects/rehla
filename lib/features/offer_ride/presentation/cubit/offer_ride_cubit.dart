import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/core/utils/app_colors.dart';
import 'package:rehla/core/utils/toast_message_method.dart';

part 'offer_ride_state.dart';

class OfferRideCubit extends Cubit<OfferRideState> {
  OfferRideCubit() : super(OfferRideInitial());

  int expectedDistance = 0;
  int expectedPrice = 0;
  int totalSeatPrice = 0;
  int seatPrice = 0;
  int numberOfSeats = 1;
  String selectedCar = 'A6';
  bool isPassenger = false;

  getAllSavedCars() {}

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
          'This is the maximum number allowed',
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
          'Must be greater than Zero',
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
          'Must be greater than Zero',
          context,
          color: AppColors.black,
        );
      }
    }
  }
}
