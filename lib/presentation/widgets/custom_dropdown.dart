import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({super.key,
    required this.value,
    required this.list,
    this.margin,
  });

  String value;
  List<String> list;
  double? margin;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Container(
          margin: EdgeInsets.all(margin??10),
          decoration: BoxDecoration(
            color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)
          ),
          child: DropdownButton<String>(
              underline: const SizedBox(),
              padding: const EdgeInsets.only(left: 10, right: 10),
              value: value,
              isExpanded: true,
              borderRadius: BorderRadius.circular(5),
              items: list.map<DropdownMenuItem<String>>((e) {
                return DropdownMenuItem<String>(
                  value: e.toString(),
                  child: Text(e),
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