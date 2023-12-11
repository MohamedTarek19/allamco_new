import 'package:allamco_project/bussiness_logic/cubits/phone_auth/phone_cubit.dart';
import 'package:allamco_project/presentation/screens/signup_screens/otp_screen.dart';
import 'package:allamco_project/presentation/widgets/custom_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        minimumSize: const Size(20, 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: const Text(
                      'عربي',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              Container(
                //color: Colors.red,
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent,
                          child: Center(
                            child: OnBoardingSlider(
                              speed: 3,
                              centerBackground: false,
                              addController: true,
                              addButton: false,
                              hasFloatingButton: false,
                              controllerColor: Colors.blue,
                              indicatorPosition: 2,
                              background: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/slide1.png'),
                                          fit: BoxFit.fitHeight)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/slide1.png'),
                                          fit: BoxFit.fitHeight)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/slide1.png'),
                                          fit: BoxFit.fitHeight)),
                                ),
                              ],
                              totalPage: 3,
                              headerBackgroundColor: Colors.black,
                              pageBodies: [
                                Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      const Text(
                                        'On your way...',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'to find the perfect looking Onboarding for your app?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      const Text(
                                        'On your way...',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'to find the perfect looking Onboarding for your app?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      const Text(
                                        'On your way...',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'to find the perfect looking Onboarding for your app?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        custom_formfield(
                          controller: phone,
                          title: 'Phone Number',
                          isNumber: true,
                          isPhone: true,
                          Validator: (value) {
                            if (value == null || value.isEmpty == true) {
                              return 'please enter your phone number';
                            } else if (int.tryParse(value) == null) {
                              return "your name shouldn't contain Characters";
                            } else if (value.length != 11) {
                              return "your phone number should be 11 digits";
                            } else if ((value[0] != '0' && value[1] != '1') &&
                                (value[2] != '0' ||
                                    value[2] != '1' ||
                                    value[2] != '2' ||
                                    value[2] != '5')) {
                              return 'Invalid phone number\n{your phone first two digits\nshould start with \'01\' and\nthe third digit is either 0,1,2, or 5}';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<PhoneCubit, PhoneState>(
                builder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black)),
                    child: TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String number =
                              '+20${phone.text.replaceFirst(RegExp(r'0'), '')}';
                          await context.read<PhoneCubit>().phoneAuthenticator(number);
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return OTPScreen(phone: number);
                          }));
                        }
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width * 0.4, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
