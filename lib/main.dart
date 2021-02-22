
import 'package:covidreportthailand/pages/DayReportPage.dart';
import 'package:covidreportthailand/pages/DetalPage.dart';
import 'package:covidreportthailand/pages/SummaryPage.dart';
import 'package:covidreportthailand/pages/TodayPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(CovidApp());
}

class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Covid Report Thailand',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
     initialRoute: "/",
      routes: {
        '/': (context) => TodayPage(),
        '/report': (context) => DayReportPage(),
        '/detal': (context) => DetelPage(),
        '/summary': (context) => SummaryPage(),
      },
    );
  }
}
