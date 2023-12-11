import 'package:allamco_project/presentation/screens/payment_screens/banking_payment/banks_screen.dart';
import 'package:allamco_project/presentation/screens/payment_screens/banking_payment/instapay_screens/instapay_screen.dart';
import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatefulWidget {
  PaymentMethodsScreen({super.key});

  List<String> options = [
    'Cash Deposit / Transfer',
    'Credit / Debit Card',
    'Instapay'
  ];
  List<Widget> icons = [
    Image.asset(
      'assets/images/cash.png',
      width: 30,
      height: 30,
    ),
    Image.asset(
      'assets/images/master.png',
      width: 30,
      height: 30,
    ),
    Image.asset(
      'assets/images/instapay.png',
      width: 40,
      height: 50,
    ),
  ];

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  late String option;

  @override
  void initState() {
    option = widget.options[0];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Select payment method'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.92,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 5),
                    child: ListView.builder(
                      itemCount: widget.options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                              left: 10,
                              right: 10),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            child: RadioListTile(
                              contentPadding: EdgeInsets.only(left: 0,right: 15),
                              secondary: widget.icons[index],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              overlayColor:MaterialStatePropertyAll(Colors.white),
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                widget.options[index],
                                style: TextStyle(fontSize: 15),
                              ),
                              fillColor:
                                  MaterialStateProperty.all(Colors.black),
                              //dense: true,
                              tileColor: Colors.grey[300],

                              value: widget.options[index],
                              groupValue: option,
                              onChanged: (value) {
                                setState(() {
                                  option = value ?? '';
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60,left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff0066FF),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      maximumSize: Size(MediaQuery.of(context).size.width*0.6, 50),
                      minimumSize: Size(MediaQuery.of(context).size.width*0.6, 50),
                    ),
                    onPressed: () {
                      if(option == widget.options[0]){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return BanksScreen();
                        },),);
                      }else if(option == widget.options[2]){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return InstaPayScreen();
                        },),);
                      }
                    },
                    child: Text('Select Payment Method',style: TextStyle(color: Colors.white,fontSize: 16),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
