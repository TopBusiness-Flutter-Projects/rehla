import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/core/utils/assets_manager.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../cubit/details_cubit.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String lang = EasyLocalization.of(context)!.locale.languageCode;
    return Scaffold(
      appBar: AppBar(
        title: Text('trip_details'.tr()),
        elevation: 0,
        backgroundColor: AppColors.primary,
      ),
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          DetailsCubit cubit = context.read<DetailsCubit>();
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 80,
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          child: ClipOval(
                            child: cubit.imagePath.isNotEmpty
                                ? Image.file(
                                    File(
                                      cubit.imagePath,
                                    ),
                                    width: 147.0,
                                    height: 147.0,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    ImageAssets.avatar,
                              width: 60,
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
                            const Text('عبد المجيد'),
                            const SizedBox(height: 12),
                            const Text('Red | Mazda3'),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: MySvgWidget(
                          path: ImageAssets.friendsIcon,
                          color: AppColors.primary,
                          height: 32,
                          width: 32,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                  color: AppColors.whiteLite,
                  thickness: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'trip_details'.tr(),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 22,
                        ),
                      ),
                      Stack(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      height: 32,
                                      width: 32,
                                    ),
                                    const SizedBox(width: 18),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'start_location'.tr(),
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            'lsefkwsiawivownd;kovnskondovnsdnosnolnsrkLDFVOANDIKVNiknvikwnk',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      height: 32,
                                      width: 32,
                                    ),
                                    const SizedBox(width: 18),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'end_location'.tr(),
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            'lsefkwsiawivownd;kovnskondovnsdnosnolnsrkLDFVOANDIKVNiknvikwnk',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              top: 22,
                              left: lang == 'en' ? 32 : null,
                              right: lang == 'ar' ? 32 : 0,
                              child: SizedBox(
                                height: 148,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    Container(
                                      color: AppColors.black,
                                      width: 1,
                                      height: 80,
                                    ),
                                    Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppColors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: [
                            MySvgWidget(
                              path: ImageAssets.dateIcon,
                              height: 32,
                              width: 32,
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date'.tr(),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '2/2/2023',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: [
                            MySvgWidget(
                              path: ImageAssets.timeIcon,
                              height: 32,
                              width: 32,
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Time'.tr(),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '2/2/2023',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: [
                            MySvgWidget(
                              path: ImageAssets.distanceIcon,
                              height: 32,
                              width: 32,
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Distance'.tr(),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '2/2/2023',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: [
                            MySvgWidget(
                              path: ImageAssets.seatIcon,
                              height: 32,
                              width: 32,
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Available Seats'.tr(),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '2/2/2023',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                  color: AppColors.whiteLite,
                  thickness: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 18),
                  child: Row(
                    children: [
                      Icon(Icons.map_outlined,color: AppColors.primary,),
                      SizedBox(width: 20),
                      Expanded(child: Text('تتبع الرحله على الخريطه',style: TextStyle(color: AppColors.primary,fontSize: 22),)),
                      Icon(lang!='en'?Icons.chevron_right_outlined:Icons.chevron_left_outlined,color: AppColors.primary,),
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                  color: AppColors.whiteLite,
                  thickness: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'driver_details'.tr(),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 22,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MySvgWidget(path: ImageAssets.dateIcon,width: 32,height: 32,),
                            MySvgWidget(path: ImageAssets.dateIcon,width: 32,height: 32,),
                            MySvgWidget(path: ImageAssets.dateIcon,width: 32,height: 32,),
                            MySvgWidget(path: ImageAssets.dateIcon,width: 32,height: 32,),
                            MySvgWidget(path: ImageAssets.dateIcon,width: 32,height: 32,),
                            MySvgWidget(path: ImageAssets.dateIcon,width: 32,height: 32,),
                            MySvgWidget(path: ImageAssets.dateIcon,width: 32,height: 32,),
                            MySvgWidget(path: ImageAssets.dateIcon,width: 32,height: 32,),

                            ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                  color: AppColors.whiteLite,
                  thickness: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'passenger'.tr(),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 22,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(3, (index) => Row(
                              children: [
                                SizedBox(
                                  width: 85,
                                  height: 100,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.white,
                                    child: ClipOval(
                                      child: cubit.imagePath.isNotEmpty
                                          ? Image.file(
                                        File(
                                          cubit.imagePath,
                                        ),
                                        width: 147.0,
                                        height: 147.0,
                                        fit: BoxFit.cover,
                                      )
                                          : Image.asset(
                                        ImageAssets.avatar,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 18),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Omar'),
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
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.primary,
                                  ),
                                )
                              ],
                            ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                  color: AppColors.whiteLite,
                  thickness: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'seat_price'.tr(),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 22,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('trip_price'.tr()),
                                Text('19.33',style: TextStyle(color: AppColors.primary),),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('gover_price'.tr()),
                                Text('-0.50',style: TextStyle(color: AppColors.primary),),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('airport_price'.tr()),
                                Text('-0.00',style: TextStyle(color: AppColors.primary),),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('app_price'.tr()),
                                Text('-1.25',style: TextStyle(color: AppColors.primary),),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('copon'.tr()),
                                Text('+0.00',style: TextStyle(color: AppColors.primary),),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('vate'.tr()),
                                Text('-2.52',style: TextStyle(color: AppColors.primary),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Divider(
                                height: 5,
                                color: AppColors.whiteLite,
                                thickness: 4,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('capten_price'.tr()),
                                Text('15.07',style: TextStyle(color: AppColors.primary),),
                              ],
                            ),


                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                  color: AppColors.whiteLite,
                  thickness: 4,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
