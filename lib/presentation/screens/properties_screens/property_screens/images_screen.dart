import 'dart:math';

import 'package:allamco_project/presentation/widgets/images_preview.dart';
import 'package:flutter/material.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key,required this.Images});

  final List<String> Images;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xffeeeef1),
          Color(0xffeeeef1),
          Color(0xffeeeef1),
        ], transform: GradientRotation(pi / 2)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(100),
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(40, 40),
                  maximumSize: const Size(40, 40),
                ),
                icon: const Center(
                    child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                )),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          actions: [],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(
            bottom: 10
          ),
          child: ListView.builder(
            itemCount: Images.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ImagesPreview(galleryItems: Images,idex: index,);
                  },),);
                },
                child: Hero(
                  tag: Images[index],
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: MediaQuery.of(context).orientation == Orientation.portrait?MediaQuery.of(context).size.height*0.27:MediaQuery.of(context).size.height*0.58,
                      width: MediaQuery.of(context).size.width,
                      //margin: EdgeInsets.only(bottom: 15),
                      //color: Colors.blue,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('${Images[index]}'),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
