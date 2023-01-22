import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/my_svg_widget.dart';
import '../cubit/add_car_cubit.dart';

class SelectCarPhotoWidget extends StatelessWidget {
  const SelectCarPhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Choose'),
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
                            type: 'camera',
                            item: 0,
                          );
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
                              const Text('Camera')
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          context.read<AddCarCubit>().pickImage(
                            type: 'photo',
                            item: 0,
                          );
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
                              const Text('Gallery')
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
                      child: const Text('Cancel'))
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
                    borderRadius:
                    const BorderRadius.all(Radius.circular(12)),
                    child: Center(
                      child: cubit.imagePath == ''
                          ? MySvgWidget(
                        path: ImageAssets.addIcon,
                        color: AppColors.error,
                        width: 32,
                        height: 32,
                      )
                          : Image.file(
                        File(
                          cubit.imagePath,
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Add Car Photo',
            style: TextStyle(color: AppColors.grey1),
          ),
        ),
      ],
    );
  }
}
