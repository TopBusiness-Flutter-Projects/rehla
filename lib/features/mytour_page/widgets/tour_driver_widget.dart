import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rehla/core/utils/toast_message_method.dart';
import 'package:rehla/core/widgets/custom_button.dart';
import 'package:rehla/features/mytour_page/cubit/my_tour_cubit.dart';

import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../../add car/models/add_Car_model.dart';
import '../../offer_ride/models/offer_ride_model.dart';

bool isImageFound = false;

class TourDriverWidget extends StatefulWidget {
  const TourDriverWidget({Key? key, required this.offerRideModel})
      : super(key: key);
  final OfferRideModel offerRideModel;

  @override
  State<TourDriverWidget> createState() => _TourDriverWidgetState();
}

class _TourDriverWidgetState extends State<TourDriverWidget> {
  AddCarModel? addCarModel;

  @override
  void initState() {
    super.initState();
    getAllSavedCars().then((value) => setState(() {}));
    if (widget.offerRideModel.driverModel != null) {
      if (widget.offerRideModel.driverModel!.diverImagePath != null) {
        isImageFound = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTourCubit, MyTourState>(
      builder: (context, state) {
        MyTourCubit cubit = context.read<MyTourCubit>();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(widget.offerRideModel.driverModel!=null)...{
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: ClipOval(
                      child: cubit.driveImagePath.isNotEmpty
                          ? Image.file(
                        File(cubit.driveImagePath),
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.cover,
                      )
                          : Image.asset(
                        ImageAssets.avatar,
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.driveName.isNotEmpty ? cubit.driveName : 'null',
                      ),
                      const SizedBox(height: 12),
                      Text(
                        addCarModel != null
                            ? '${addCarModel!.carColorContent} | ${addCarModel!.carModelContent}'
                            : '',
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          ...List.generate(
                            5,
                                (index) => Icon(
                              Icons.star,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text('تقيمات 1'),
                        ],
                      )
                    ],
                  ),
                ),
              },
              InkWell(
                onTap: () {
                  openDialog('Add Driver'.tr(), context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MySvgWidget(
                    path: ImageAssets.friendsIcon,
                    color: AppColors.primary,
                    height: 32,
                    width: 32,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<AddCarModel> getAllSavedCars() async {
    addCarModel = await Preferences.instance.getAllSavedCars();
    return addCarModel!;
  }

  openDialog(String title, context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: double.infinity,
          color: AppColors.buttonBackground,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(title),
              ),
              Container(
                width: double.infinity,
                height: 4,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
        content: const DialogWidget(),
      ),
    );
  }
}

class DialogWidget extends StatefulWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  String driverImagePath = '';

  pickImage({required String type}) async {
    XFile? imageFile = await ImagePicker().pickImage(
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
    driverImagePath = croppedFile!.path;
    setState(() {
      isImageFound = true;
    });
  }

  TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text('Choose'.tr()),
                  ),
                  contentPadding: EdgeInsets.zero,
                  content: SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Row(
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            pickImage(type: 'camera');
                            Navigator.of(context).pop();
                          },
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt,
                                    size: 45, color: AppColors.gray),
                                Text('camera'.tr())
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            pickImage(type: 'photo');
                            Navigator.of(context).pop();
                          },
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.photo,
                                    size: 45, color: AppColors.gray),
                                Text('Gallery'.tr())
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'.tr()))
                  ],
                ),
              );
            },
            child: SizedBox(
              width: 80,
              height: 80,
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                child: ClipOval(
                  child: driverImagePath.isNotEmpty
                      ? Image.file(
                          File(driverImagePath),
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          ImageAssets.avatar,
                          width: 80,
                          height: 80,
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Driver Name'.tr(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              fillColor: AppColors.gray200,
              filled: true,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Driver Name !!!'.tr();
              }
              return null;
            },
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Save'.tr(),
                  color: AppColors.primary,
                  onClick: () {
                    if (formKey.currentState!.validate()) {
                      if (driverImagePath.isEmpty) {
                        toastMessage('Please Select The Image !!!'.tr(), context,
                            color: AppColors.error);
                      } else {
                        context.read<MyTourCubit>().saveDriverData(
                              driverImagePath,
                              nameController.text,
                            );
                        Future.delayed(
                          const Duration(milliseconds: 300),
                          () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    }
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                    text: 'Close'.tr(),
                    color: AppColors.error,
                    onClick: () {
                      Navigator.pop(context);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
