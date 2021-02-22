import 'dart:convert';

import 'package:covidreportthailand/models/summaryData.dart';
import 'package:http/http.dart' as Http;

class SummaryCase {
  var province_len = 0;
  var nation_len = 0;
  var gender_len = 0;
  var province_lable = [];
  var nation_lable = [];
  var gender_lable = [];
  var province_value = [];
  var nation_value = [];
  var gender_value = [];
  var len = 0;
  var lable = [];
  var value = [];
  var select = 0;

  void getSummary() async {
    var response = await Http.get("https://covidth.herokuapp.com/CovidSummary.php");
    Map map = json.decode(response.body);
    SummaryData row = SummaryData.fromJson(map);
    province_len = row.province.length;
    nation_len = row.nation.length;
    gender_len = row.gender.length;
    province_lable = row.province;
    nation_lable = row.nation;
    gender_lable = row.gender;
    province_value = row.provinceValue;
    nation_value = row.nationValue;
    gender_value = row.genderValue;
  }

  void SetTab(int Tab){
    select=Tab;
    switch(select){
      case 0:
        value=province_value;
        len=province_len;
        lable=province_lable;
        break;
      case 1:
        value=nation_value;
        len=nation_len;
        lable=nation_lable;
        break;
      case 2:
        value=gender_value;
        len=gender_len;
        lable=gender_lable;
        break;

    }

  }


}
