import 'package:easy_localization/easy_localization.dart'as tr;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/add_car_cubit.dart';
import 'car_plate_widget.dart';

class CarPlateMainWidget extends StatelessWidget {
  const CarPlateMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AddCarCubit>().formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text('Car Plate'.tr()),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: PinCodeTextField(
                        hintCharacter: '',
                        errorTextSpace: 40,
                        validator: (value) {
                          if (value!.length < 4) {
                            return 'Please Enter All Fields !!!'.tr();
                          }
                          return null;
                        },
                        appContext: context,
                        length: 4,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          fieldOuterPadding: const EdgeInsets.only(top: 18),
                          inactiveColor: AppColors.gray,
                          activeColor: AppColors.gray,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(6),
                          borderWidth: 1.5,
                          fieldHeight: 40,
                          selectedColor: AppColors.primary,
                        ),
                        cursorColor: AppColors.primary,
                        animationDuration: const Duration(milliseconds: 300),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<AddCarCubit>().carPlateNumContent =
                              value;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  CarPlateWidget(
                    title: 'Car Plate'.tr(),
                    indexes: 0,
                  ),
                  CarPlateWidget(
                    title: 'Car Plate'.tr(),
                    indexes: 1,
                  ),
                  CarPlateWidget(
                    title: 'Car Plate'.tr(),
                    indexes: 2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: TextFormField(
                controller: context.read<AddCarCubit>().sequenceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Car Sequence Number'.tr(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: AppColors.gray200,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Car Sequence Number !!!'.tr();
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
