import 'package:allamco_project/presentation/screens/signin_screens/sign_in.dart';
import 'package:allamco_project/presentation/screens/signup_screens/biometric_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CreatePin extends StatelessWidget {
  CreatePin({super.key});
  var otpTextStyles = [
    const TextStyle(fontSize: 16),
    const TextStyle(fontSize: 16),
    const TextStyle(fontSize: 16),
    const TextStyle(fontSize: 16),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      margin: const EdgeInsets.only(top: 50),
                      child: Column(

                        children: [
                          const Text(
                            "Create pin",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: OtpTextField(
                                numberOfFields: 4,
                                borderColor: const Color(0xFF512DA8),
                                styles: otpTextStyles,
                                fieldWidth: 45,
                                //set to true to show as box or false to show as dash
                                showFieldAsBox: true,
                                //runs when a code is typed in
                                onCodeChanged: (String code) {
                                  //handle validation or checks here
                                },
                                //runs when every textfield is filled
                                onSubmit: (String verificationCode) async {

                                }, // end onSubmit
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black)
                            ),
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) {
                                  return SignIn();
                                },));
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(MediaQuery.of(context).size.width*0.4, 45),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                              ),
                              child: const Text('Next',style: TextStyle(color: Colors.black,fontSize: 18),),
                            ),
                          ),
                          const Spacer(),



                        ],
                      ),
                    ),
                  ],
                )


          ),
        ),
      ),
    );
  }
}
