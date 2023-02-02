import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/remote/service.dart';
import 'features/add car/presentation/cubit/add_car_cubit.dart';
import 'features/mytour_page/cubit/my_tour_cubit.dart';
import 'features/navigation_bottom/cubit/navigator_bottom_cubit.dart';
import 'features/offer_ride/presentation/cubit/offer_ride_cubit.dart';
import 'features/trip_details/cubit/details_cubit.dart';

// import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features

  ///////////////////////// Blocs ////////////////////////
  serviceLocator.registerFactory(() => NavigatorBottomCubit());
  serviceLocator.registerFactory(() => AddCarCubit());
  serviceLocator.registerFactory(() => OfferRideCubit());
  serviceLocator.registerFactory(() => MyTourCubit());
  serviceLocator.registerFactory(() => DetailsCubit());


  ///////////////////// Use Cases ////////////////////////
  //
  // serviceLocator.registerLazySingleton(
  //     () => GetSavedLanguageUseCase(languageRepository: serviceLocator()));
  //
  //////////////////////// Repositories ////////////////////////

  // serviceLocator.registerLazySingleton<BaseLanguageRepository>(
  //   () => LanguageRepository(
  //     languageLocaleDataSource: serviceLocator(),
  //   ),
  // );
  //
  //////////////////////// Data Sources ////////////////////////
  //
  // serviceLocator.registerLazySingleton<BaseLanguageLocaleDataSource>(
  //     () => LanguageLocaleDataSource(sharedPreferences: serviceLocator()));
  //
  //! Core
  //Network
  // serviceLocator.registerLazySingleton(() => NavigationService());
  // serviceLocator.registerLazySingleton<BaseNetworkInfo>(
  //     () => NetworkInfo(connectionChecker: serviceLocator()));

  // Api Consumer
  serviceLocator.registerLazySingleton(() => ServiceApi(serviceLocator()));

  //! External
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  // http
  // serviceLocator.registerLazySingleton(() => http.Client());

  // Dio

  serviceLocator.registerLazySingleton(
    () => Dio(
      BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    ),
  );
  // serviceLocator.registerLazySingleton(() => AppInterceptors());
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );

  // Internet Connection Checker
  // serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
