import 'package:flutter/material.dart';

class custom_formfield extends StatefulWidget {
  custom_formfield({
    super.key,
    required this.controller,
    required this.title,
    required this.Validator,
    this.suffix,
    required this.isNumber,
    required this.isPhone,
    this.obsecure,
    this.leftPadding,
    this.rightPadding,
  });
  bool isPhone = false;
  bool isNumber = false;
  TextEditingController controller;
  String title;
  String? Function(String?) Validator;
  Widget? suffix;
  bool? obsecure;
  double? leftPadding;
  double? rightPadding;

  @override
  State<custom_formfield> createState() => _custom_formfieldState();
}

class _custom_formfieldState extends State<custom_formfield> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.leftPadding??10.0, right: widget.rightPadding??10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isPhone?
          Expanded(
            child: Center(
              child: Container(
                height: 45,
                decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.only(right: 5,bottom: 20),
                child: const Center(child: Text('+20')),
              ),
            ),
          ):
          Container(),
          Expanded(
            flex: 4,
            child: SizedBox(
              height: 70,
              child: TextFormField(
                obscureText: widget.obsecure?? false,
                keyboardType:widget.isNumber?const TextInputType.numberWithOptions(): TextInputType.text,
                controller: widget.controller,
                validator: widget.Validator,
                cursorHeight: 20,
                decoration: InputDecoration(

                  suffix: widget.suffix,
                  // suffix: IconButton(onPressed: () {
                  //
                  // }, icon: Container(padding: EdgeInsets.all(5), child: Text('Validate'),decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(5)),)),
                  contentPadding: const EdgeInsets.all(10),
                  labelText: widget.title,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide.none,
                  ),

                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                      gapPadding: 4
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
