import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/add_car_cubit.dart';

class CarPlateWidget extends StatelessWidget {
  CarPlateWidget({
    Key? key,
    required this.indexes,
    required this.title,
  }) : super(key: key);
  final int indexes;
  final String title;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCarCubit, AddCarState>(
      builder: (context, state) {
        AddCarCubit cubit = context.read<AddCarCubit>();
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
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
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                          cubit.carPlate.length,
                          (index) => InkWell(
                            onTap: () {
                              cubit.changeSelectPlateItems(
                                indexes,
                                cubit.carPlate[index],
                                context,
                              );
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 0,
                                ),
                                child: Text(
                                  cubit.carPlate[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.grey1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey1, width: 1.5),
                borderRadius: BorderRadius.circular(6),
                color: AppColors.white,
              ),
              child: Center(
                child: Text(
                  cubit.carPlateTextContent[indexes] == '#'
                      ? ''
                      : cubit.carPlateTextContent[indexes],
                  style: TextStyle(color: AppColors.grey1),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
