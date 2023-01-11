import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../models/status_response_model.dart';
import '../models/user_statistic_model.dart';
import 'handle_exeption.dart';

class ServiceApi {
  final Dio dio;

  ServiceApi(this.dio);


}
