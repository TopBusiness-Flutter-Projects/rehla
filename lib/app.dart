import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehla/core/utils/app_colors.dart';
import 'package:rehla/injector.dart' as injector;

import 'core/utils/app_routes.dart';
import 'core/utils/app_strings.dart';
import 'features/add car/presentation/cubit/add_car_cubit.dart';
import 'features/navigation_bottom/cubit/navigator_bottom_cubit.dart';
import 'features/offer_ride/presentation/cubit/offer_ride_cubit.dart';

class Rehla extends StatefulWidget {
  Rehla({Key? key}) : super(key: key);

  @override
  State<Rehla> createState() => _RehlaState();
}

class _RehlaState extends State<Rehla> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injector.serviceLocator<NavigatorBottomCubit>(),
        ),
        BlocProvider(
          create: (_) => injector.serviceLocator<AddCarCubit>(),
        ),
BlocProvider(
          create: (_) => injector.serviceLocator<OfferRideCubit>(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
