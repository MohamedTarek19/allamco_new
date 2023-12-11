import 'package:flutter/material.dart';

class dataItem extends StatelessWidget {
  const dataItem({
    super.key,
    required this.title,
    required this.percent,
  });
  final String title;
  final String percent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: const TextStyle(color: Colors.black38),),
        Text(percent,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ],
    );
  }
}