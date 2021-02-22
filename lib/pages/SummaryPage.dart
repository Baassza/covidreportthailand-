import 'package:covidreportthailand/Drawer.dart';
import 'package:covidreportthailand/Style.dart';
import 'package:covidreportthailand/state/state_Summary.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SummaryPage extends StatelessWidget {
  final rm = RM.inject<SummaryCase>(() => SummaryCase());

  @override
  Widget build(BuildContext context) {
    rm.setState((s) async {
      await s.getSummary();
      s.SetTab(0);
    }, silent: false);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: SideMenu(),
        body: ListSummary(),
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              rm.setState((s) => s.SetTab(index), silent: false);
            },
            tabs: [
              Tab(
                child: Text(
                  "รายงานตามจังหวัด",
                  style: TextRowCardStyle,
                ),
              ),
              Tab(
                  child: Text(
                "รายงานตามเชื้อชาติ",
                style: TextRowCardStyle,
              )),
              Tab(
                  child: Text(
                "รายงานตามเพศ",
                style: TextRowCardStyle,
              )),
            ],
          ),
          title: Text(
            "รายงานสรุป",
            style: TextCardStyle,
          ),
        ),
      ),
    );
  }

  Widget ListSummary() {
    return rm.rebuilder(() {
      if(rm.state.len==0){
        return Load();
      }
      else{
        return ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(rm.state.lable[index] +
                      " จำนวน " +
                      rm.state.value[index].toString() +
                      " คน",style: TextUpdateStyle,),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
              ],
            );
          },
          itemCount: rm.state.len,
        );
      }
    });
  }
}
