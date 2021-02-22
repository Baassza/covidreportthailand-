import 'package:covidreportthailand/Drawer.dart';
import 'package:covidreportthailand/Style.dart';
import 'package:covidreportthailand/state/state_Detel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class DetelPage extends StatelessWidget {
  @override
  final rm = RM.inject<Detel>(() => Detel());

  Widget build(BuildContext context) {
    rm.setState(
      (s) => s.getDetal(),
    );

    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        actions: [
          FlatButton.icon(
            onPressed: () {
              rm.setState((s) => s.getDetal());
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            label: Text(""),
          ),
        ],
        title: Text(
          "รายงานผู้ติดเชื้อรายบุคคล",
          style: TextCardStyle,
        ),
      ),
      body: ListCase(),
    );
  }

  Widget ListCase() {
    return rm.rebuilder(() {
     if(rm.state.len==0){
       return Load();
     }
     else{
       return ListView.builder(
         itemCount: rm.state.len,
         itemBuilder: (context, index) {
           return Column(
             children: [
               Column(
                 children: [
                   SizedBox(height: 5),
                   Text("คนที่ " + rm.state.Date.data[index].no,
                       style: GoogleFonts.kanit()),
                   SizedBox(height: 10),
                   Text(
                       "ตรวจพบเชื้อเมื่อ  " +
                           rm.state.Date.data[index].confirmDate,
                       style: GoogleFonts.kanit()),
                   SizedBox(height: 10),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       children: [
                         Text("จังหวัด " + rm.state.Date.data[index].province,
                             style: GoogleFonts.kanit()),
                         SizedBox(width: 5),
                         Text("อำเภอ " + rm.state.Date.data[index].district,
                             style: GoogleFonts.kanit()),
                         SizedBox(width: 5),
                       ],
                     ),
                   ),
                   SizedBox(height: 10),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       children: [
                         Text("อายุ " + rm.state.age[index],
                             style: GoogleFonts.kanit()),
                         SizedBox(width: 5),
                         Text("เพศ " + rm.state.Date.data[index].gender,
                             style: GoogleFonts.kanit()),
                         SizedBox(width: 5),
                         Text("เชื้อชาติ " + rm.state.Date.data[index].nation,
                             style: GoogleFonts.kanit()),
                       ],
                     ),
                   ),
                   SizedBox(
                     height: 10,
                   )
                 ],
               ),
               Divider(
                 thickness: 2,
                 color: Colors.black,
               ),
             ],
           );
         },
       );
     }
    });
  }
}
