class DetelCase {
  List<Data> data;
  String lastData;
  String updateDate;
  String source;
  String devBy;
  String severBy;

  DetelCase(
      {this.data,
        this.lastData,
        this.updateDate,
        this.source,
        this.devBy,
        this.severBy});

  DetelCase.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = new List<Data>();
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    lastData = json['LastData'];
    updateDate = json['UpdateDate'];
    source = json['Source'];
    devBy = json['DevBy'];
    severBy = json['SeverBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }

    data['LastData'] = this.lastData;
    data['UpdateDate'] = this.updateDate;
    data['Source'] = this.source;
    data['DevBy'] = this.devBy;
    data['SeverBy'] = this.severBy;
    return data;
  }
}

class Data {
  String confirmDate;
  String no;
  dynamic age;
  String gender;
  String genderEn;
  String nation;
  String nationEn;
  String province;
  int provinceId;
  String district;
  String provinceEn;
  int statQuarantine;

  Data(
      {this.confirmDate,
        this.no,
        this.age,
        this.gender,
        this.genderEn,
        this.nation,
        this.nationEn,
        this.province,
        this.provinceId,
        this.district,
        this.provinceEn,
        this.statQuarantine});

  Data.fromJson(Map<String, dynamic> json) {
    confirmDate = json['ConfirmDate'];
    no = json['No'];
    age = json['Age'];
    gender = json['Gender'];
    genderEn = json['GenderEn'];
    nation = json['Nation'];
    nationEn = json['NationEn'];
    province = json['Province'];
    provinceId = json['ProvinceId'];
    district = json['District'];
    provinceEn = json['ProvinceEn'];
    statQuarantine = json['StatQuarantine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ConfirmDate'] = this.confirmDate;
    data['No'] = this.no;
    data['Age'] = this.age;
    data['Gender'] = this.gender;
    data['GenderEn'] = this.genderEn;
    data['Nation'] = this.nation;
    data['NationEn'] = this.nationEn;
    data['Province'] = this.province;
    data['ProvinceId'] = this.provinceId;
    data['District'] = this.district;
    data['ProvinceEn'] = this.provinceEn;
    data['StatQuarantine'] = this.statQuarantine;
    return data;
  }
}
