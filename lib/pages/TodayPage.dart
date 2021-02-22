import 'package:covidreportthailand/Drawer.dart';
import 'package:covidreportthailand/Style.dart';
import 'package:covidreportthailand/state/state_today.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class TodayPage extends StatelessWidget {
  final rm = RM.inject<TodayData>(() => TodayData()); //DI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          elevation: 0,
        ),
        drawer: SideMenu(),
        body: Stack(
          children: [
            Bg(context, Colors.lightBlue),
            UI(context),
          ],
        ));
  }

  @override
  Widget UI(BuildContext context) {
    rm.setState(
      (s) => s.getToday(),
      silent: true,
    );
    return rm.rebuilder(() {
      if (rm.state.Date == "") {
        return Load();
      } else {
        return Column(
          children: [
            TopTitle(context, "รายงานสถานการณ์ โควิด-19"),
            UpdateText(context, rm.state.Date),
            TopCard(context, rm.state.Current[0], rm.state.New[0]),
            RowCard(context, rm.state.Current, rm.state.New),
          ],
        );
      }
    });
  }
}
