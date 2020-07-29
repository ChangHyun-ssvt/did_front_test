import 'dart:convert';

class EnteranceInfo {
  EnteranceInfo(
      {this.date,
      this.companyToEnter,
      this.gate,
      this.distinction,
      this.responsibility,
      this.responsibilityPhone,
      this.purpose});

  String date;
  String companyToEnter;
  String gate;
  String distinction;
  String responsibility;
  String responsibilityPhone;
  String purpose;

  factory EnteranceInfo.fromJson(Map<String, dynamic> json) {
    return EnteranceInfo(
      date: json['date'],
      companyToEnter: json['companyToEnter'] as String,
      gate: json['gate'] as String,
      distinction: json['distinction'] as String,
      responsibility: json['responsibility'] as String,
      responsibilityPhone: json['responsibilityPhone'] as String,
      purpose: json['purpose'] as String,
    );
  }

}

class UserInfo {
  UserInfo(
      {this.companyCameFrom, this.name, this.rank, this.birthday, this.phone});

  String companyCameFrom;
  String name;
  String rank;
  String birthday;
  String phone;

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      companyCameFrom: json['companyCameFrom'] as String,
      name: json['name'] as String,
      rank: json['rank'] as String,
      birthday: json['birthday'] as String,
      phone: json['phone'] as String,
    );
  }

  getKeys() {
    return this.getKeys();
  }
}

class CredentialRequestInfo {
  CredentialRequestInfo({this.userInfo, this.enteranceInfo, this.connectionId});

  UserInfo userInfo;
  EnteranceInfo enteranceInfo;
  String connectionId;

  factory CredentialRequestInfo.fromJson(Map<String, dynamic> json) {
    return CredentialRequestInfo(
      connectionId: json['connectionId'] as String,
      userInfo: UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      enteranceInfo:
          EnteranceInfo.fromJson(json['enteranceInfo'] as Map<String, dynamic>),
    );
  }


  List<String> getKeys() {
    List<String> keys = List<String> ();
    keys.add('companyCameFrom');
    keys.add('name');
    keys.add('rank');
    keys.add('birthday');
    keys.add('phone');
    keys.add('date');
    keys.add('companyToEnter');
    keys.add('distinction');
    keys.add('responsibility');
    keys.add('responsibilityPhone');
    keys.add('purpose');
    keys.add('connectionId');
    return keys;
  }

  List<String> getValues() {
    List<String> values = List<String> ();
    values.add(userInfo.companyCameFrom);
    values.add(userInfo.name);
    values.add(userInfo.rank);
    values.add(userInfo.birthday);
    values.add(userInfo.phone);
    values.add(enteranceInfo.date);
    values.add(enteranceInfo.companyToEnter);
    values.add(enteranceInfo.distinction);
    values.add(enteranceInfo.responsibility);
    values.add(enteranceInfo.responsibilityPhone);
    values.add(enteranceInfo.purpose);
    values.add(connectionId);
    return values;
  }
}
