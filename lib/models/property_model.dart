import 'package:flutter/material.dart';

class PropertyModel {
  String? title;
  String? ad;
  double? funding;
  double? annualReturn;
  double? annualAppreciation;
  double? projectedGross;
  double? projectedNet;
  List<String>? Images;
  int? Investors;
  double? propertyPrice;
  double? area;
  int? remainingDays;
  double? monthlyRent;
  TextEditingController? rent;


  PropertyModel({
    this.funding,
    this.title,
    this.ad,
    this.annualAppreciation,
    this.annualReturn,
    this.projectedGross,
    this.projectedNet,
    this.Images,
    this.area,
    this.Investors,
    this.propertyPrice,
    this.remainingDays,
    this.monthlyRent,
    this.rent,
  });
}
