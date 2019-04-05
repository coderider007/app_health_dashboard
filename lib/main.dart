import 'package:flutter/material.dart';
import './screens/home.dart';


void main() => runApp(HealthDashboardApp());

class HealthDashboardApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}


