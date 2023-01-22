import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:rehla/core/utils/app_colors.dart';
import 'package:rehla/core/widgets/custom_button.dart';

import '../widgets/prices_widget.dart';

class OfferRideScreen extends StatelessWidget {
  OfferRideScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text =
        'Please write something about you and trip instructions such as: \n* Please hold your personal identity with you. \n* Only one travel bag is allowed.\n* What is your favorite sport club!\n* Tell us about your hobbies and interests so that others will know you on the same trip.';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offer Ride'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 18,
                child: Text(
                  'Offer A Ride',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                            color: AppColors.gray200,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 80,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppColors.primary),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: AppColors.transparent,
                                  ),
                                  const Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Set Start Location',
                                            style: TextStyle(
                                                color: AppColors.gray),
                                          ),
                                          Icon(
                                            Icons.my_location,
                                            color: AppColors.gray,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: AppColors.white,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: DateTimePicker(
                                            type: DateTimePickerType.time,
                                            initialDate:
                                                DateTime(DateTime.now().year),
                                            initialValue: '',
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2100),
                                            style: TextStyle(
                                                color: AppColors.gray),
                                            decoration: InputDecoration(
                                              hintText:
                                                  '${DateTime.now().hour < 10 ? '0${DateTime.now().hour}' : DateTime.now().hour}:${DateTime.now().minute < 10 ? '0${DateTime.now().minute}' : DateTime.now().minute}:${DateTime.now().second < 10 ? '0${DateTime.now().second}' : DateTime.now().second}',
                                              border: InputBorder.none,
                                              // prefixIcon: Icon(
                                              //   Icons.calendar_month_outlined,
                                              //   color: AppColors.gray,
                                              // ),
                                            ),
                                            // onChanged: (val) => print(val),
                                            // validator: (val) {
                                            //   print(val);
                                            //   return null;
                                            // },
                                            // onSaved: (val) => print(val),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                            color: AppColors.gray200,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 80,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: AppColors.transparent,
                                  ),
                                  const Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Set End Location',
                                            style: TextStyle(
                                                color: AppColors.gray),
                                          ),
                                          Container()
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: AppColors.white,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Reaching Time',
                                            style: TextStyle(
                                                color: AppColors.gray),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
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
                      left: 32,
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
                              height: 116,
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
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    // initialDate: DateTime(DateTime.now().month),
                    initialValue: '',
                    firstDate: DateTime(DateTime.now().year),
                    lastDate: DateTime(2100),
                    style: TextStyle(
                      color: AppColors.gray,
                    ),
                    decoration: InputDecoration(
                      hintText:
                          '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              PricesWidget(),
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // hintText: 'Car Sequence Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: AppColors.gray200,
                  filled: true,
                ),
                style: TextStyle(color: AppColors.gray),
                minLines: 8,
                maxLines: 20,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Car Sequence Number !!!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              CustomButton(
                text: 'Create',
                color: AppColors.primary,
                onClick: () {},
                paddingHorizontal: 110,
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
