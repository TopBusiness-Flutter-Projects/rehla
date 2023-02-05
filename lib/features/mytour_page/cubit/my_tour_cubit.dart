import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/features/offer_ride/models/offer_ride_model.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/toast_message_method.dart';
import '../../offer_ride/models/list_of_offer_ride_model.dart';

part 'my_tour_state.dart';

class MyTourCubit extends Cubit<MyTourState> {
  MyTourCubit() : super(MyTourInitial()) {
    getAllSavedOffers();
  }

  List<OfferRideModel> offerRideModelList = [];
  List<OfferRideModel> lastOfferRideModelList = [];

  String driveImagePath = '';
  String driveName = '';
  OfferRideModel? offerRideModelTemp;
  int index = 0;

  List<PassengerModel> passengerModelList = [];

  setData(OfferRideModel offerRideModel, int index) {
    this.index = index;
    offerRideModelTemp = offerRideModel;
    if (offerRideModel.driverModel != null) {
      driveImagePath = offerRideModel.driverModel!.diverImagePath!;
      driveName = offerRideModel.driverModel!.diverName!;
    } else {
      driveImagePath = '';
      driveName = '';
    }

    if (offerRideModel.passengerModel != null) {
      passengerModelList = offerRideModel.passengerModel!;
    } else {
      passengerModelList = [];
    }
  }

  saveDriverData(String driveImagePath, String driveName) {
    this.driveImagePath = driveImagePath;
    this.driveName = driveName;
    offerRideModelTemp!.driverModel = DriverModel(
      diverName: driveName,
      diverImagePath: driveImagePath,
    );
    Preferences.instance.saveTripDriversAndPassengers(
      index: index,
      offerRideModel: offerRideModelTemp!,
    );
    emit(MyTourSaveDriverData());
  }

  savePassengerData(String passengerImagePath, String passengerName,bool isDelete,int index) {
    if(isDelete){
      passengerModelList.removeAt(index);
    }else{
      passengerModelList.add(
        PassengerModel(
          passengerName: passengerName,
          passengerImagePath: passengerImagePath,
        ),
      );
    }
    offerRideModelTemp!.passengerModel = passengerModelList;
    Preferences.instance.saveTripDriversAndPassengers(
      index: index,
      offerRideModel: offerRideModelTemp!,
    );
    emit(MyTourSaveDriverData());
  }

  getAllSavedOffers() async {
    OfferRideListModel offerRideListModel = OfferRideListModel(offerRide: []);
    offerRideListModel = await Preferences.instance.getAllSavedOffers();
    offerRideModelList = offerRideListModel.offerRide ?? [];
    lastOfferRideModelList = offerRideListModel.lastOfferRide ?? [];
    emit(MyTourGetAllOffersRides());
  }

  deleteTrip(int index, BuildContext context) async {
    offerRideModelList.removeAt(index);
    OfferRideListModel offerRideListModel = OfferRideListModel(
      offerRide: offerRideModelList,
      lastOfferRide: lastOfferRideModelList,
    );
    Preferences.instance.deleteTrip(offerRideListModel).then((value) {
      getAllSavedOffers();
      toastMessage(
        'Trip Ended Successfully'.tr(),
        context,
        color: AppColors.success,
        duration: 300,
      );
    });
  }

  changeTripStatus({required int index, required int status}) {
    Preferences.instance.changeTripStatus(index: index, status: status).then(
          (value) => getAllSavedOffers(),
        );
  }
}
