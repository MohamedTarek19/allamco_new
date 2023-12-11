import 'package:flutter/material.dart';

class CustomDropDownIcons extends StatelessWidget {
  CustomDropDownIcons({super.key,
    required this.value,
    required this.list
  });

  String value;
  List<String> list;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Container(
          padding: EdgeInsets.only(left: 2),
          decoration: BoxDecoration(
            color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)
          ),
          child: DropdownButton<String>(
              underline: const SizedBox(),
              value: value,
              isExpanded: true,
              borderRadius: BorderRadius.circular(5),
              items: list.map<DropdownMenuItem<String>>((e) {
                return DropdownMenuItem<String>(
                  value: e.toString(),
                  child: Image.asset(e,fit: BoxFit.fitWidth,),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  value = val!;
                });
              }),
        );
      },
    );
  }
}