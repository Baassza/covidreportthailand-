class SummaryData {
  List<String> province;
  List<int> provinceValue;
  List<String> nation;
  List<int> nationValue;
  List<String> gender;
  List<int> genderValue;

  SummaryData(
      {this.province,
        this.provinceValue,
        this.nation,
        this.nationValue,
        this.gender,
        this.genderValue});

  SummaryData.fromJson(Map<String, dynamic> json) {
    province = json['Province'].cast<String>();
    provinceValue = json['Province_value'].cast<int>();
    nation = json['Nation'].cast<String>();
    nationValue = json['Nation_value'].cast<int>();
    gender = json['Gender'].cast<String>();
    genderValue = json['Gender_value'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Province'] = this.province;
    data['Province_value'] = this.provinceValue;
    data['Nation'] = this.nation;
    data['Nation_value'] = this.nationValue;
    data['Gender'] = this.gender;
    data['Gender_value'] = this.genderValue;
    return data;
  }
}
