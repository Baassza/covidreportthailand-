import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:covidreportthailand/models/DetalCase.dart';

class Detel
{
  DetelCase Date;
  int len=0;
  int rev=0;
  List age=[];
  void getDetal() async
  {
    var response = await Http.get("https://covid19.th-stat.com/api/open/cases");
    Map map = json.decode(response.body);
    DetelCase row = DetelCase.fromJson(map);
    await Future.delayed(Duration(seconds: 2));
    len=row.data.length;
    for(int i=0;i<len;i++){

      if(row.data[i].age==null){
        age.add("ไม่ทราบอายุ");
      }
      if(row.data[i].age!=null){
        age.add(row.data[i].age.toString()+" ปี");
      }
      if(row.data[i].district==""){
        row.data[i].district="ไม่ทราบ";
      }
      row.data[i].confirmDate=row.data[i].confirmDate.replaceAll("00:00:00", "");
      var tempdate=row.data[i].confirmDate.split("-");
      row.data[i].confirmDate=tempdate[2]+"/"+tempdate[1]+"/"+tempdate[0];
    }
    Date=row;
  }



}