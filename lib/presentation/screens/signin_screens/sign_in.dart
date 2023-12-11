import 'package:allamco_project/bussiness_logic/cubits/biometric_cubits/biometric_auth_cubit.dart';

import 'package:allamco_project/presentation/screens/main_home.dart';
import 'package:allamco_project/presentation/widgets/custom_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  TextEditingController Password = TextEditingController();
  TextEditingController Email = TextEditingController();
  bool obsecure = true;
  String biometric = 'Sign in using device biometrics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
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
        scrolledUnderElevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        margin: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                margin: const EdgeInsets.only(right: 6, left: 6),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      custom_formfield(
                        controller: Email,
                        title: 'Email Address',
                        leftPadding: 5,
                        rightPadding: 5,
                        isNumber: false,
                        isPhone: false,
                        Validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your Email';
                          } else if (!value.contains('@') ||
                              !value.contains('.com')) {
                            return "your email should be in the format of xxxx@xx.com";
                          }
                          return null;
                        },
                      ),
                      StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function())
                                setState) {
                          return custom_formfield(
                            controller: Password,
                            title: 'Password',
                            leftPadding: 5,
                            rightPadding: 5,
                            isNumber: false,
                            isPhone: false,
                            obsecure: obsecure,
                            suffix: Padding(
                              padding:
                                  const EdgeInsets.only(top: 2.0),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      obsecure = !obsecure;
                                    });
                                  },
                                  child: obsecure
                                      ? const Icon(Icons
                                          .visibility_outlined)
                                      : const Icon(Icons
                                          .visibility_off_outlined)),
                            ),
                            Validator: (value) {
                              var temp = value?.split('');
                              if (value == null ||
                                  value.isEmpty) {
                                return 'please enter your password';
                              } else if (!value.contains(
                                      RegExp(r'[0-9]')) ||
                                  !value.contains(
                                      RegExp(r'[a-z]')) ||
                                  !value.contains(
                                      RegExp(r'[A-Z]'))) {
                                return "your password should contain four small letters,\ncapital letters and four numbers";
                              } else if ((temp
                                              ?.where((element) =>
                                                  element.contains(RegExp(
                                                      r'[0-9]')))
                                              .length ??
                                          0) <
                                      4 ||
                                  (temp?.where((element) => element.contains(RegExp(r'[a-z]'))).length ??
                                          0) <
                                      4 ||
                                  (temp
                                              ?.where((element) =>
                                                  element.contains(
                                                      RegExp(r'[A-Z]')))
                                              .length ??
                                          0) <
                                      4) {
                                return "your password should contain four small letters,\ncapital letters and four numbers";
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black)),
                child: TextButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => false);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return HomePage();
                    },));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(
                          MediaQuery.of(context).size.width * 0.8,
                          45),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5))),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Divider(
                        height: 1,
                        color: Colors.grey,
                        endIndent: 0,
                        indent: 50,
                        thickness: 1,
                      )),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Or',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Divider(
                        height: 1,
                        color: Colors.grey,
                        endIndent: 50,
                        indent: 0,
                        thickness: 1,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black)),
                child: BlocBuilder<BiometricAuthCubit,
                    BiometricAuthState>(
                  builder: (context, state) {
                    return TextButton(
                      onPressed: () async {
                        if(context.read<BiometricAuthCubit>().canAuthenticate){
                          await context.read<BiometricAuthCubit>().authenticate();
                          if(context.read<BiometricAuthCubit>().isAuthenticated){
                            Navigator.popUntil(context, (route) => false);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return HomePage();
                            },));
                          }
                        }
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: Size(
                              MediaQuery.of(context).size.width *
                                  0.8,
                              45),
                          maximumSize: Size(
                              MediaQuery.of(context).size.width *
                                  0.8,
                              45),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5))),
                      child: state is onBioAuthLoading? Center(child: CircularProgressIndicator(color: Colors.purple,),):Text(
                        context.read<BiometricAuthCubit>().canAuthenticate ? 'Sign in using device biometrics' : 'Biometric is not available',
                        style: const TextStyle(
                            color: Colors.black, fontSize: 18),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
