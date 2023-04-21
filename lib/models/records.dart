import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Records {
 
  // String? id;
  String? leadName;
  String? mobile;
  String? secondaryMobile;
  String? email;
  String? address;
  int? pincode;
  String? companyName;
  int? experiance;
  int? salary;
  String? companyAddress;
  int? companyPincode;
  String? companyCity;
  int? dealAmount;
  String? serviceType;
  String? source;
  String? followupDate;
  String? followupTime;
  String? leadStatus;
  String? remarks;

  Records({
    // this.id,
    this.leadName,
    this.mobile,
    this.secondaryMobile,
    this.email,
    this.address,
    this.pincode,
    this.companyName,
    this.experiance,
    this.salary,
    this.companyAddress,
    this.companyPincode,
    this.companyCity,
    this.dealAmount,
    this.serviceType,
    this.source,
    this.followupDate,
    this.followupTime,
    this.leadStatus,
    this.remarks
  });
  toJson() {
    return {
      "leadName": leadName,
      "mobile": mobile,
      "secondaryMobile":secondaryMobile,
      "email":email,
      "address":address,
      "pincode":pincode,
      "companyName":companyName,
      "experiance":experiance,
      "salary":salary,
      "companyAddress":companyAddress,
      "companyPincode":companyPincode,
      "companyCity":companyCity,
      "dealAmount":dealAmount,
      "serviceType":serviceType,
      "source":source,
      "followupDate":followupDate,
      "followupTime":followupTime,
      "leadStatus":leadStatus,
      "remarks":remarks
    };
  }
   factory Records.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Records(
      leadName: data["leadName"],
      mobile: data["mobile"],
      secondaryMobile:data["secondaryMobile"] ,
      email:data["email"] ,
      address: data["address"],
      pincode:data["pincode"] ,
      companyName:data["companyName"] ,
      experiance:data["experiance"] ,
      salary:data["salary"] ,
      companyAddress:data["companyAddress"] ,
      companyPincode: data["companyPincode"],
      companyCity:data["companyCity"] ,
      dealAmount:data["dealAmount"] ,
      serviceType:data["serviceType"] ,
      source:data["source"],
      followupDate:data["followupDate"],
      followupTime:data["followupTime"],
      leadStatus:data["leadStatus"],
      remarks:data["remarks"] ,
    );
  }
}
