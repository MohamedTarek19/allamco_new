import 'package:allamco_project/presentation/screens/payment_screens/payment_methods.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Payment - Currency',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'Which currency do you want to do your payment with?',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return PaymentMethodsScreen();
                      },),);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          //: MediaQuery.of(context).size.height*0.3,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Egyptian Pound (EGP)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.blue),
                              ),
                              Text(
                                'Add money to your EGP Balance to able to invest in the Egyptian Market',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 20,color: Colors.black26,endIndent: 1,thickness: 1,)
          ],
        ),
      ),
    );
  }
}
