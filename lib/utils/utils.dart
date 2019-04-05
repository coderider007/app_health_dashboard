import 'package:flutter/material.dart';

Widget getStatus(int status) {
  Widget statusIcon;

  switch (status) {
    case 1:
      statusIcon = Text(
        'SUCCESS',
        style: TextStyle(
            color: Colors.green, fontSize: 14.0, fontWeight: FontWeight.bold),
      );
      break;
    case 2:
      statusIcon = Text(
        'WARNING',
        style: TextStyle(
            color: Colors.orange, fontSize: 14.0, fontWeight: FontWeight.bold),
      );
      break;
    case 3:
      statusIcon = Text(
        'ERROR',
        style: TextStyle(
            color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.bold),
      );
      break;
    default:
      statusIcon = Text(
        'UNKNOWN',
        style: TextStyle(
            color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.bold),
      );
      break;
  }
  return statusIcon;
}
