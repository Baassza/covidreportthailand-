import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:covidreportthailand/models/Today.dart';

class TodayData
{
  List Current = ["--","--","--","--"];
  List New = ["--","--","--","--"];
  String Date ="";

    void getToday() async {
    var url = "https://covid19.th-stat.com/api/open/today";
    var response = await Http.get(url);
    Map map = json.decode(response.body);
    Today data = Today.fromJson(map);
    await Future.delayed(Duration(seconds: 2));
    Current[0]=leru(data.confirmed).toString();
    Current[1]=leru(data.recovered).toString();
    Current[2]=leru(data.hospitalized).toString();
    Current[3]=leru(data.deaths).toString();
    New[0]=leru(data.newConfirmed).toString();
    New[1]=leru(data.newRecovered).toString();
    New[2]=leru(data.newHospitalized).toString();
    New[3]=leru(data.newDeaths).toString();
    Date=data.updateDate;


  }
  int leru(int data){
    if(data>=0){
      return data;
    }
    else{
      return 0;
    }
  }

}