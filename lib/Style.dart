import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var TextCardStyle = GoogleFonts.kanit(
  textStyle: TextStyle(
    color: Colors.white,
    fontSize: 24,
  ),
);

Widget Load(){
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
    ),
  );
}





var TextSideMenu = GoogleFonts.kanit(
  textStyle: TextStyle(
    color: Colors.pinkAccent,
    fontSize: 26,
  ),
);

var TextRowCardStyle = GoogleFonts.kanit(
  textStyle: TextStyle(
    color: Colors.white,
    fontSize: 14,
  ),
);

var TextTopStyle = GoogleFonts.kanit(
  textStyle: TextStyle(
    color: Colors.teal,
    fontSize: 28,
  ),
);

var TextUpdateStyle = GoogleFonts.kanit(
  textStyle: TextStyle(
    color: Colors.teal,
    fontSize: 20,
  ),
);

Widget TopTitle(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 30),
    child: Text(
      text,
      style: TextTopStyle,
    ),
  );
}

Widget UpdateText(BuildContext context, String date) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
    child: Text(
      "อัพเดทข้อมูลล่าสุด : " + date,
      style: TextUpdateStyle,
    ),
  );
}

Widget Bg(BuildContext context, Color bg_color) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: bg_color,
  );
}

Widget TopCard(BuildContext context, String Confirmed, String NewConfirmed) {
  return Center(
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.pinkAccent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ติดเชื้อสะสม",
              style: TextCardStyle,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              Confirmed,
              style: TextCardStyle,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "เพิ่มขึ้น ",
                  style: TextCardStyle,
                ),
                Text(
                  NewConfirmed,
                  style: TextCardStyle,
                ),
                Text(
                  " คน",
                  style: TextCardStyle,
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget RowCard(BuildContext context, List Current, List New) {
  return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardR(context, Current[1], New[1]),
          CardH(context, Current[2], New[2]),
          CardD(context, Current[3], New[3]),
        ],
      ));
}

Widget CardR(BuildContext context, String Current, String New) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.2,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.lightGreen,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "หายแล้ว",
              style: TextRowCardStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              Current,
              style: TextRowCardStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "เพิ่มขึ้น ",
                  style: TextRowCardStyle,
                ),
                Text(
                  New,
                  style: TextRowCardStyle,
                ),
                Text(
                  " คน",
                  style: TextRowCardStyle,
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget CardH(BuildContext context, String Current, String New) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.2,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "อยู่ใน รพ.",
              style: TextRowCardStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              Current,
              style: TextRowCardStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "เพิ่มขึ้น ",
                  style: TextRowCardStyle,
                ),
                Text(
                  New,
                  style: TextRowCardStyle,
                ),
                Text(
                  " คน",
                  style: TextRowCardStyle,
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget CardD(BuildContext context, String Current, String New) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.2,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "เสียชีวิต",
              style: TextRowCardStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              Current,
              style: TextRowCardStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "เพิ่มขึ้น ",
                  style: TextRowCardStyle,
                ),
                Text(
                  New,
                  style: TextRowCardStyle,
                ),
                Text(
                  " คน",
                  style: TextRowCardStyle,
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

