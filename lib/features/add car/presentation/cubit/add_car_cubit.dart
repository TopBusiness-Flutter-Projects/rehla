import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rehla/core/utils/app_colors.dart';
import 'package:rehla/core/utils/toast_message_method.dart';
import 'package:rehla/features/add%20car/models/add_Car_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/models/car_brand_model.dart';

part 'add_car_state.dart';

class AddCarCubit extends Cubit<AddCarState> {
  AddCarCubit() : super(AddCarInitial()) {
    readJson().whenComplete(() => emit(AddCarDataSuccess()));
  }

  List<CarsBrands> carBrandModel = [];

  List<String> carBrand = [];
  List<String> carModels = [];
  List<String> carTypes = [
    'Private Car',
    'Public Transport',
    'Private Transport',
    'Private Taxi',
    'Taxi',
    'Export',
    'Diplomatic',
  ];
  List<String> carColors = [
    'Red',
    'Green',
    'Black',
    'White',
    'Blue',
    'Yellow',
    'Silver',
    'Gray',
    'Gold',
    'Purple',
    'Brown',
    'Beige',
    'Orange',
    'Gray',
    'Gray/Black',
  ];
  List<String> carSeats = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];
  List<String> productionYear = [
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
  ];
  List<String> carPlate = [
    'ا',
    'ب',
    'ح',
    'د',
    'ر',
    'س',
    'ص',
    'ط',
    'ع',
    'ق',
    'ك',
    'ل',
    'م',
    'ن',
    'ه',
    'و',
    'ى',
  ];
  List<String> carPlateTextContent = [
    '#',
    '#',
    '#',
  ];

  String? carBrandContent;
  String? carModelContent;
  String? carTypeContent;
  String? carColorContent;
  String? carSeatContent;
  String? carPlateNumContent;
  String? productionYearContent;
  String imagePath = '';
  String imagePath1 = '';
  String imagePath2 = '';
  String imagePath3 = '';
  XFile? imageFile;

  TextEditingController sequenceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/car_brand/car-list_en.json');
    carBrandModel = carsBrandsFromJson(response)!;
    for (var element in carBrandModel) {
      carBrand.add(element.brand!);
    }
  }

  changeSelectedItem(String kind, String content, BuildContext context) {
    if (kind == 'brand') {
      carBrandContent = content;
      Future.delayed(const Duration(milliseconds: 300), () {
        for (var element in carBrandModel) {
          carModels = element.models!;
        }
        emit(AddCarDataSuccess());
      });
      Navigator.pop(context);
    } else if (kind == 'model') {
      carModelContent = content;
      Future.delayed(const Duration(milliseconds: 300), () {
        emit(AddCarDataSuccess());
      });
      Navigator.pop(context);
    } else if (kind == 'type') {
      carTypeContent = content;
      Future.delayed(const Duration(milliseconds: 300), () {
        emit(AddCarDataSuccess());
      });
      Navigator.pop(context);
    } else if (kind == 'color') {
      carColorContent = content;
      Future.delayed(const Duration(milliseconds: 300), () {
        emit(AddCarDataSuccess());
      });
      Navigator.pop(context);
    } else if (kind == 'production') {
      productionYearContent = content;
      Future.delayed(const Duration(milliseconds: 300), () {
        emit(AddCarDataSuccess());
      });
      Navigator.pop(context);
    } else if (kind == 'seats') {
      carSeatContent = content;
      Future.delayed(const Duration(milliseconds: 300), () {
        emit(AddCarDataSuccess());
      });
      Navigator.pop(context);
    }
  }

  changeSelectPlateItems(int index, String content, BuildContext context) {
    carPlateTextContent[index] = content;
    Future.delayed(const Duration(milliseconds: 300), () {
      print(carPlateTextContent);
      emit(AddCarDataSuccess());
    });
    Navigator.pop(context);
  }

  pickImage({required String type, required int item}) async {
    imageFile = await ImagePicker().pickImage(
      source: type == 'camera' ? ImageSource.camera : ImageSource.gallery,
    );
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: imageFile!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9
      ],
      cropStyle: CropStyle.rectangle,
      compressFormat: ImageCompressFormat.png,
      compressQuality: 90,
    );

    item == 0
        ? imagePath = croppedFile!.path
        : item == 1
            ? imagePath1 = croppedFile!.path
            : item == 2
                ? imagePath2 = croppedFile!.path
                : imagePath3 = croppedFile!.path;
    emit(AddCarPickImageSuccess());
  }

  saveAddCarModelToShared(BuildContext context) async {
    AddCarModel addCarModel = AddCarModel(
      carPhoto: imagePath,
      carBrandContent: carBrandContent,
      carModelContent: carModelContent,
      carTypeContent: carTypeContent,
      carColorContent: carColorContent,
      productionYearContent: productionYearContent,
      carSeatContent: carSeatContent,
      carPlateTextContent:
      '${carPlateTextContent[0]} ${carPlateTextContent[1]} ${carPlateTextContent[2]} ${carPlateNumContent!}',
      sequenceNumber: sequenceController.text,
      drivingLicencePhoto: imagePath1,
      carInsurancePhoto: imagePath2,
      carPaper: imagePath3,
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('addCar', addCarModel.toJson().toString()).then((value) {
      Navigator.pop(context);
      Future.delayed(const Duration(milliseconds: 300),(){
        toastMessage('Saved Successfully', context,color: AppColors.success);
      });
    });
  }
}
