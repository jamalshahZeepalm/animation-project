import 'package:flutter/material.dart';

class DemoData {
  String title;
  String subTitle;
  Color color;
  bool status;
  DemoData({
    required this.title,
    required this.subTitle,
    required this.color,
    required this.status,
  });
}

List<DemoData> myList = [
  DemoData(
      title: '无可否认',
      subTitle:
        "is simply dummy text of the printing and typesetting industry. ",  color: Colors.red,
      status: true),
  DemoData(
      title: '有些出于偶然',
      subTitle:
         "is simply dummy text of the printing and typesetting industry. ", color: Colors.black,
      status: true),
  DemoData(
      title: 'Lorem ',
      subTitle:
        "is simply dummy text of the printing and typesetting industry. ", color: Colors.green,
      status: false),
  DemoData(
      title: 'Ipsum',
      subTitle:
          "is simply dummy text of the printing and typesetting industry. ", color: Colors.yellow,
      status: true),
  DemoData(
      title: '也称乱数假文或者哑元文本',
      subTitle:
          "is simply dummy text of the printing and typesetting industry. ",color: Colors.greenAccent,
      status: true),
  DemoData(
      title: 'Ipsum',
      subTitle:
          "is simply dummy text of the printing and typesetting industry. ", color: Colors.purple,
      status: false),
  DemoData(
      title: 'Leatraset',
      subTitle:
         "is simply dummy text of the printing and typesetting industry. ", color: Colors.redAccent,
      status: true),
  DemoData(
      title: '年代',
      subTitle:
          "is simply dummy text of the printing and typesetting industry. ",color: Colors.yellowAccent,
      status: false),
  DemoData(
      title: 'hello',
      subTitle:
          "is simply dummy text of the printing and typesetting industry. ", color: Colors.deepOrange,
      status: false),
];
