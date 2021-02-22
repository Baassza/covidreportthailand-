import 'package:covidreportthailand/Style.dart';
import 'package:covidreportthailand/state/state_DayReport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../Drawer.dart';

class DayReportPage extends StatelessWidget {
  final rm = RM.inject<DayReport>(() => DayReport());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          elevation: 0,
        ),
        drawer: SideMenu(),
        body: Stack(
          children: [
            Bg(context, Colors.yellow),
            UI(context),
          ],
        ));
  }

  @override
  Widget UI(BuildContext context) {
    rm.setState(
          (s) async {
        await s.getReport();
        await s.readdata(DateTime.now());
      },
      silent: true,
    );
    return rm.rebuilder(() {
      if (rm.state.len==0) {
        return Load();
      }
      else {
        return Column(
          children: [
            TopTitle(context, "รายงานสถานการณ์ โควิด-19"),
            DatePiker(context, rm.state.Date),
            TopCard(context, rm.state.Current[0], rm.state.New[0]),
            RowCard(context, rm.state.Current, rm.state.New),
          ],
        );
      }
    });
  }

  Widget DatePiker(BuildContext context, String show) {
    return rm.rebuilder(() =>
        FlatButton(
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(2020, 1, 1),
                  maxTime: DateTime(2021, 12, 1),
                  onConfirm: (date) {
                    rm.setState((s) => s.readdata(date));
                  },
                  currentTime: rm.state.selece_date,
                  locale: LocaleType.th);
            },
            child: Text(
              'เลือกวัน $show',
              style: TextUpdateStyle,
            )));
  }
}
