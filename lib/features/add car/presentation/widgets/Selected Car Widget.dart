import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/features/add%20car/presentation/cubit/add_car_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/toast_message_method.dart';

class SelectedCarWidget extends StatelessWidget {
  SelectedCarWidget({
    Key? key,
    required this.title,
    required this.containerTitle,
    required this.listLength,
    required this.kind,
    required this.listItems,
  }) : super(key: key);
  final String kind;
  final String title;
  final String containerTitle;
  final List<String> listItems;
  final int listLength;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCarCubit, AddCarState>(
      builder: (context, state) {
        AddCarCubit cubit = context.read<AddCarCubit>();
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(title),
              ),
              InkWell(
                onTap: () {
                  if (kind == 'model') {
                    if (cubit.carModels.isEmpty) {
                      toastMessage(
                        'Please Select Car Brand !!',
                        context,
                        color: AppColors.black,
                      );
                    } else {
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
                                  listLength,
                                      (index) => InkWell(
                                    onTap: () {
                                      print('12345678901234567890-1234567890-');
                                      cubit.changeSelectedItem(
                                        kind,
                                        listItems[index],
                                        context,
                                      );
                                    }
                                    ,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 0,
                                        ),
                                        child: Text(
                                          listItems[index],
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
                    }
                  }else{
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
                                listLength,
                                    (index) => InkWell(
                                  onTap: () {
                                    print('12345678901234567890-1234567890-');
                                    cubit.changeSelectedItem(
                                      kind,
                                      listItems[index],
                                      context,
                                    );
                                  }
                                  ,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 0,
                                      ),
                                      child: Text(
                                        listItems[index],
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
                  }

                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey1,
                      width: 0.5
                    ),
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.gray200,
                  ),
                  child: Text(
                    containerTitle,
                    style: TextStyle(color: AppColors.grey1),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
