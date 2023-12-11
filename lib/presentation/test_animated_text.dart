import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  AnimatedText({super.key,required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blueAccent,),);
  }
}
