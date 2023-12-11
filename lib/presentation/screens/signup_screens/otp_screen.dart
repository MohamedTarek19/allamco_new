
import 'package:allamco_project/presentation/screens/signup_screens/create_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:allamco_project/bussiness_logic/cubits/phone_auth/phone_cubit.dart';
class OTPScreen extends StatelessWidget {
  OTPScreen({super.key, required this.phone});

  String phone;
  var otpTextStyles = [
    const TextStyle(fontSize: 16),
    const TextStyle(fontSize: 16),
    const TextStyle(fontSize: 16),
    const TextStyle(fontSize: 16),
    const TextStyle(fontSize: 16),
    const TextStyle(fontSize: 16),
  ];
  Stream<int> stream =
  Stream<int>.periodic(const Duration(
      seconds: 1), (count) => 29 - count).take(30);
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: BlocConsumer<PhoneCubit, PhoneState>(
              listener: (context, state) async {

              },
              builder: (context, state) {
                context.read<PhoneCubit>().isverifing = false;
                return Column(
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
                          Text(
                            "We have sent a 6 figures code to your phone ($phone),check your sms",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: OtpTextField(
                                numberOfFields: 6,
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
                                  showDialog(context: context,barrierDismissible: false, builder: (context) {
                                    return const Center(child: CircularProgressIndicator());
                                  },);
                                  flag = await context.read<PhoneCubit>().verifyOTP(verificationCode);
                                  Navigator.pop(context);
                                  showDialog(
                                    barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return flag == true? const AlertDialog(
                                          title: Text("Verified"),
                                        ):const AlertDialog(
                                          title: Text("not verified"),
                                          content: Text(
                                              'check the code again!!'),
                                          actions: [],
                                        );
                                      });
                                  Future.delayed(const Duration(seconds: 1)).then((value) {
                                    if(flag == true){
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                                        return CreatePin();
                                      }));
                                    }else{
                                      Navigator.pop(context);
                                    }
                                  });
                                }, // end onSubmit
                              ),
                            ),
                          ),
                          flag == false?Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: StreamBuilder<int>(
                              stream: stream,
                              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                                return
                                  snapshot.data == 0?TextButton(
                                    child: const Text('Resend the code\n or go back to re-enter your number',textAlign: TextAlign.center,),
                                    onPressed: () async {
                                      await context.read<PhoneCubit>().phoneAuthenticator(phone);
                                      stream = Stream<int>.periodic(const Duration(
                                          seconds: 1), (count) => 29 - count).take(30);
                                    }):
                                Text('Resend the code in ${snapshot.data ?? 30} seconds')
                                ;
                              },
                            ),

                          ):Container(),
                        ],
                      ),
                    ),
                    //Spacer(),

                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
