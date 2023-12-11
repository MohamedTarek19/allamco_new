import 'package:allamco_project/bussiness_logic/cubits/biometric_cubits/biometric_auth_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BiometricAuth extends StatelessWidget {
  const BiometricAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              child: BlocBuilder<BiometricAuthCubit, BiometricAuthState>(
                builder: (context, state) {
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
                            const Text(
                              "Make your accont more secure",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.ltr,
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border.all(color: Colors.black)),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width * 0.4,
                                        45),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1))),
                                child: const Text(
                                  'Enable Face ID',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border.all(color: Colors.black)),
                              child: TextButton(
                                onPressed: () async {
                                  print(await context.read<BiometricAuthCubit>().authenticate());
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width * 0.4,
                                        45),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1))),
                                child: const Text(
                                  'Finger print',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 3,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black)),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width * 0.4,
                                        45),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                child: const Text(
                                  'Skip now',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
