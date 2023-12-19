import 'dart:developer';

class MarkersModel {
  int? statusCode;
  bool? success;
  List<Data>? data;
  String? message;

  MarkersModel({this.statusCode, this.success, this.data, this.message});

  MarkersModel.fromJson(json) {
    log("jsoooooooon $json");
    statusCode = json['status_code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? taskID;
  String? lat;
  String? longt;
  String? name;

  Data({this.taskID, this.lat, this.longt, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    taskID = json['TaskID'];
    lat = json['Lat'];
    longt = json['Longt'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TaskID'] = this.taskID;
    data['Lat'] = this.lat;
    data['Longt'] = this.longt;
    data['Name'] = this.name;
    return data;
  }
}
