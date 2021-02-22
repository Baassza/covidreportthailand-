import 'package:covidreportthailand/Style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(children: [
            Image.asset("images/bg.jpg"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("เมนู",
                  style: GoogleFonts.kanit(
                    textStyle: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 54,
                    ),
                  )),
            ),
          ]),
          Divider(),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Row(
              children: [
                Image.asset(
                  'images/coronavirus.png',
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "แสดงค่าประจำวัน",
                  style: TextSideMenu,
                ),
              ],
            ),
          ),
          Divider(),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/report');
            },
            child: Row(
              children: [
                Image.asset(
                  'images/coronavirus.png',
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "ข้อมูลสรุปตามช่วงเวลา",
                  style: TextSideMenu,
                ),
              ],
            ),
          ),
          Divider(),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/detal');
            },
            child: Row(
              children: [
                Image.asset(
                  'images/coronavirus.png',
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "ข้อมูลแต่ละเคส",
                  style: TextSideMenu,
                ),
              ],
            ),
          ),
          Divider(),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/summary');
            },
            child: Row(
              children: [
                Image.asset(
                  'images/coronavirus.png',
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "รายงานสรุป",
                  style: TextSideMenu,
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
