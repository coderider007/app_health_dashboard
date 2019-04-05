// https://app.quicktype.io/

// To parse this JSON data, do
//
//     final appStatus = appStatusFromJson(jsonString);

import 'dart:convert';

AppStatus appStatusFromJson(String str) {
  final jsonData = json.decode(str);
  return AppStatus.fromJson(jsonData);
}

String appStatusToJson(AppStatus data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

List<AppStatus> appStatusListFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<AppStatus>.from(jsonData.map((x) => AppStatus.fromJson(x)));
}

String appStatusListToJson(List<AppStatus> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class AppStatus {
  String appId;
  int status;
  String appName;
  String time;
  String discription;
  String logo;
  String detailsHtml;

  AppStatus({
    this.appId,
    this.status,
    this.appName,
    this.time,
    this.discription,
    this.logo,
    this.detailsHtml,
  });

  factory AppStatus.fromJson(Map<String, dynamic> json) => new AppStatus(
        appId: json["appId"],
        status: json["status"],
        appName: json["appName"],
        time: json["time"],
        discription: json["discription"],
        logo: json["logo"],
        detailsHtml: json["detailsHtml"],
      );

  Map<String, dynamic> toJson() => {
        "appId": appId,
        "status": status,
        "appName": appName,
        "time": time,
        "discription": discription,
        "logo": logo,
        "detailsHtml": detailsHtml,
      };
}
