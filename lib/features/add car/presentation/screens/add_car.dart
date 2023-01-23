import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/core/utils/app_colors.dart';
import 'package:rehla/core/utils/toast_message_method.dart';
import 'package:rehla/features/add%20car/presentation/cubit/add_car_cubit.dart';

import '../../../../core/widgets/custom_button.dart';
import '../widgets/Selected Car Widget.dart';
import '../widgets/car_plate_main_widget.dart';
import '../widgets/required_photos_widget.dart';
import '../widgets/select_car_photo_widget.dart';

class AddCarScreen extends StatelessWidget {
  const AddCarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text('Add Car'.tr()),
          elevation: 0,
          backgroundColor: AppColors.primary),
      body: BlocBuilder<AddCarCubit, AddCarState>(
        builder: (context, state) {
          AddCarCubit cubit = context.read<AddCarCubit>();
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 18),
                const SelectCarPhotoWidget(),
                SelectedCarWidget(
                  kind: 'brand',
                  title: 'Select Car Brand'.tr(),
                  containerTitle: cubit.carBrandContent ?? 'Car Brand'.tr(),
                  listLength: cubit.carBrand.length,
                  listItems: cubit.carBrand,
                ),
                SelectedCarWidget(
                  kind: 'model',
                  title: 'Select Car Model'.tr(),
                  containerTitle: cubit.carModelContent ?? 'Car Model'.tr(),
                  listLength: cubit.carModels.length,
                  listItems: cubit.carModels,
                ),
                SelectedCarWidget(
                  kind: 'type',
                  title: 'Select Car Type'.tr(),
                  containerTitle: cubit.carTypeContent ?? 'Car Type'.tr(),
                  listLength: cubit.carTypes.length,
                  listItems: cubit.carTypes,
                ),
                SelectedCarWidget(
                  kind: 'color',
                  title: 'Select Car Color'.tr(),
                  containerTitle: cubit.carColorContent ?? 'Car Color'.tr(),
                  listLength: cubit.carColors.length,
                  listItems: cubit.carColors,
                ),
                SelectedCarWidget(
                  kind: 'production',
                  title: 'Select Production Year'.tr(),
                  containerTitle: cubit.productionYearContent ?? '2019',
                  listLength: cubit.productionYear.length,
                  listItems: cubit.productionYear,
                ),
                const SizedBox(height: 20),
                SelectedCarWidget(
                  kind: 'seats',
                  title: 'Select Car Seats'.tr(),
                  containerTitle: cubit.carSeatContent ?? '1',
                  listLength: cubit.carSeats.length,
                  listItems: cubit.carSeats,
                ),
                const CarPlateMainWidget(),
                const SizedBox(height: 18),
                const RequiredPhotosWidget(),
                const SizedBox(height: 25),
                CustomButton(
                  text: 'Save'.tr(),
                  color: AppColors.primary,
                  onClick: () {
                    if (cubit.formKey.currentState!.validate()) {
                     if (cubit.imagePath == '') {
                      toastMessage(
                        'Please Select Car Photo !!!'.tr(),
                        context,
                        color: AppColors.error,
                      );
                    }else if (cubit.carBrandContent == null) {
                        toastMessage(
                          'Please Select Car Brand !!!'.tr(),
                          context,
                          color: AppColors.error,
                        );
                      } else if (cubit.carModelContent == null) {
                        toastMessage(
                          'Please Select Car Model !!!'.tr(),
                          context,
                          color: AppColors.error,
                        );
                      }else if (cubit.carTypeContent == null) {
                        toastMessage(
                          'Please Select Car Type !!!'.tr(),
                          context,
                          color: AppColors.error,
                        );
                      }else if (cubit.carColorContent == null) {
                        toastMessage(
                          'Please Select Car Color !!!'.tr(),
                          context,
                          color: AppColors.error,
                        );
                      }else if(cubit.carPlateTextContent.contains('#')) {
                       toastMessage(
                         'Please Select Car Plate Letters !!!'.tr(),
                         context,
                         color: AppColors.error,
                       );
                     }
                     else if (cubit.imagePath1 == '') {
                       toastMessage(
                         'Please Select Driving Licence Photo !!!'.tr(),
                         context,
                         color: AppColors.error,
                       );
                     }else if (cubit.imagePath2 == '') {
                       toastMessage(
                         'Please Select Car Insurance Photo !!!'.tr(),
                         context,
                         color: AppColors.error,
                       );
                     }else if (cubit.imagePath3 == '') {
                       toastMessage(
                         'Please Select Car Paper Photo !!!'.tr(),
                         context,
                         color: AppColors.error,
                       );
                     }else{
                       cubit.saveAddCarModelToShared(context);
                     }
                    }
                  },
                  paddingHorizontal: 40,
                ),
                const SizedBox(height: 25),
              ],
            ),
          );
        },
      ),
    );
  }
}
