import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/features/add%20car/presentation/cubit/add_car_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/my_svg_widget.dart';

class RequiredPhotosWidget extends StatefulWidget {
  const RequiredPhotosWidget({Key? key}) : super(key: key);

  @override
  State<RequiredPhotosWidget> createState() => _RequiredPhotosWidgetState();
}

class _RequiredPhotosWidgetState extends State<RequiredPhotosWidget> {
  int containerChoose = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            'Upload Required Photos'.tr(),
            style: TextStyle(color: AppColors.grey1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      containerChoose = 1;
                    });
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: containerChoose == 1
                          ? AppColors.primary
                          : AppColors.gray200,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MySvgWidget(
                          height: 32,
                          width: 32,
                          color: containerChoose == 1
                              ? AppColors.white
                              : AppColors.black,
                          path: ImageAssets.drivingLicenceIcon,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Driving Licence'.tr(),
                          style: TextStyle(
                            fontSize: 20,
                            color: containerChoose == 1
                                ? AppColors.white
                                : AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      containerChoose = 2;
                    });
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: containerChoose == 2
                          ? AppColors.primary
                          : AppColors.gray200,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MySvgWidget(
                          height: 32,
                          width: 32,
                          color: containerChoose == 2
                              ? AppColors.white
                              : AppColors.black,
                          path: ImageAssets.carInsuranceIcon,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Car Insurance'.tr(),
                          style: TextStyle(
                            fontSize: 20,
                            color: containerChoose == 2
                                ? AppColors.white
                                : AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      containerChoose = 3;
                    });
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: containerChoose == 3
                          ? AppColors.primary
                          : AppColors.gray200,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MySvgWidget(
                          height: 32,
                          width: 32,
                          color: containerChoose == 3
                              ? AppColors.white
                              : AppColors.black,
                          path: ImageAssets.carPaperIcon,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Car Paper'.tr(),
                          style: TextStyle(
                            fontSize: 20,
                            color: containerChoose == 3
                                ? AppColors.white
                                : AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title:  Padding(
                    padding:const EdgeInsets.symmetric(vertical: 5),
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
                            context.read<AddCarCubit>().pickImage(
                                type: 'camera', item: containerChoose);
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
                            context.read<AddCarCubit>().pickImage(
                                type: 'photo', item: containerChoose);
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
                        child:  Text('Cancel'.tr()))
                  ],
                ),
              );
            },
            child: BlocBuilder<AddCarCubit, AddCarState>(
              builder: (context, state) {
                AddCarCubit cubit = context.read<AddCarCubit>();
                return SizedBox(
                  height: 120,
                  width: 120,
                  child: DottedBorder(
                    strokeWidth: 2,
                    dashPattern: const [12],
                    borderType: BorderType.Rect,
                    color: AppColors.grey1,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Center(
                        child: (cubit.imagePath1 == '' &&
                                    containerChoose == 1) ||
                                (cubit.imagePath2 == '' &&
                                    containerChoose == 2) ||
                                (cubit.imagePath3 == '' && containerChoose == 3)
                            ? MySvgWidget(
                                path: ImageAssets.addIcon,
                                color: AppColors.error,
                                width: 32,
                                height: 32,
                              )
                            : Image.file(
                                File(
                                  containerChoose == 1
                                      ? cubit.imagePath1
                                      : containerChoose == 2
                                          ? cubit.imagePath2
                                          : cubit.imagePath3,
                                ),
                                width: 147.0,
                                height: 147.0,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}
