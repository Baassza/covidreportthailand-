import 'dart:convert';
import 'package:covidreportthailand/models/DayReport.dart';
import 'package:http/http.dart' as Http;
class DayReport{
  int len=0;
  Daydata Data;
  List Current = ["--","--","--","--"];
  List New = ["--","--","--","--"];
  String Date=DateTime.now().day.toString()+'/'+DateTime.now().month.toString()+'/'+DateTime.now().year.toString();
  DateTime selece_date=DateTime.now();
  void getReport() async {
    var response = await Http.get("https://covid19.th-stat.com/api/open/timeline");
    Map map = json.decode(response.body);
    Daydata row = Daydata.fromJson(map);
    await Future.delayed(Duration(seconds: 2));
    len=row.data.length;
    Data=row;
  }
  void readdata(date)
  {
    var now=DateTime.now();
    final birthday =date;
    final date2 = now;
    var difference = date2.difference(birthday).inDays;
    var len = Data.data.length;
    selece_date=date;
    if(difference<0){
      difference=0;
      selece_date=DateTime.now();
    }
    if(difference==len){
      difference--;
    }
    Current[0]=leru(Data.data[len-difference-1].confirmed).toString();
    Current[1]=leru(Data.data[len-difference-1].recovered).toString();
    Current[2]=leru(Data.data[len-difference-1].hospitalized).toString();
    Current[3]=leru(Data.data[len-difference-1].deaths).toString();
    New[0]=leru(Data.data[len-difference-1].newConfirmed).toString();
    New[1]=leru(Data.data[len-difference-1].newRecovered).toString();
    New[2]=leru(Data.data[len-difference-1].newHospitalized).toString();
    New[3]=leru(Data.data[len-difference-1].newDeaths).toString();
    var listdate=(Data.data[len-difference-1].date).split("/");
    Date=listdate[1]+"/"+listdate[0]+"/"+listdate[2];
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