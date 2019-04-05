import 'package:http/http.dart' as http;
import 'dart:async';
import './../models/app_status_model.dart';

const String URL_HEALTH_API = 'http://localhost:8080/apphealthapi/health';

Future<List<AppStatus>> getHealthAll() async {
  final response = await http.get(URL_HEALTH_API);
  print(response.body);
  return appStatusListFromJson(response.body);
}

Future<AppStatus> getHealth(String appId) async {
  final response = await http.get('$URL_HEALTH_API/$appId');
  return appStatusFromJson(response.body);
}
