import 'package:allamco_project/bussiness_logic/cubits/biometric_cubits/biometric_auth_cubit.dart';

import 'package:allamco_project/presentation/screens/signin_screens/sign_in.dart';
import 'package:allamco_project/presentation/screens/signup_screens/peronal_info.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class SingUpAndInScreen extends StatelessWidget {
  SingUpAndInScreen({super.key});

  final List<String> imagesList = [
    'assets/images/slider.png'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imagesList
        .map(
          (item) => ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(5),
          topLeft: Radius.circular(5),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Image.asset(
            item,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ),
    )
        .toList();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              minimumSize: const Size(20, 30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: const Text(
            'عربي',
            style: TextStyle(fontSize: 17),
          ),
        )],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).orientation ==
                        Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.35
                        : MediaQuery.of(context).size.height * 0.59,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        enlargeFactor: 10.6,
                        disableCenter: true,
                      ),
                      items: imageSliders,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15,top: 50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Material(
                        borderRadius: BorderRadius.circular(5),
                        elevation: 7,
                        //type: MaterialType.transparency,
                        child: Container(
                          //margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff0066FF),
                              border: Border.all(color: Color(0xff0066FF))),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return PersonalInfo();
                                  }));
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xff0066FF),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.4, 45),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300],
                            border: Border.all(color: Colors.grey[300]!)),
                        child:
                            BlocBuilder<BiometricAuthCubit, BiometricAuthState>(
                          builder: (context, state) {
                            return TextButton(
                              onPressed: () async {
                                await context.read<BiometricAuthCubit>().canAuth();
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return SignIn();
                                }));
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.grey[300],
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.4,
                                      45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: const Text(
                                'Sign In',
                                style:
                                    TextStyle(color: Colors.black, fontSize: 18),
                              ),
                            );
                          },
                        ),
                      ),


                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
