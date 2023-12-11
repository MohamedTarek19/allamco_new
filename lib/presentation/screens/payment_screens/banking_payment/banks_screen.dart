import 'package:allamco_project/presentation/screens/payment_screens/banking_payment/aaib_bank.dart';
import 'package:allamco_project/presentation/screens/payment_screens/banking_payment/eg_bank.dart';
import 'package:allamco_project/presentation/screens/payment_screens/banking_payment/nbe_bank.dart';
import 'package:flutter/material.dart';

class BanksScreen extends StatefulWidget {
  BanksScreen({super.key});
  List<String> options = [
    'EG Bank',
    'National Bank of Egypt',
    'Arab African International Bank'
  ];
  List<Widget> icons = [
    Image.asset(
      'assets/images/egbank.png',
      width: 30,
      height: 30,
    ),
    Image.asset(
      'assets/images/nbe.png',
      width: 30,
      height: 30,
    ),
    Image.asset(
      'assets/images/aanb.png',
      width: 70,
      height: 50,
    ),
  ];
  @override
  State<BanksScreen> createState() => _BanksScreenState();
}

class _BanksScreenState extends State<BanksScreen> {
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
        title: Text('Select a Bank'),
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
            padding: const EdgeInsets.only(left: 10, right: 10,bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height > 600?MediaQuery.of(context).size.height * 0.46:MediaQuery.of(context).size.height*0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 15),
                        child: Text('Cash Deposit / Transfer',style: TextStyle(fontSize: 18),),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.38,
                        child: ListView.builder(
                          itemCount: widget.options.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height * 0.04,
                                  left: 20,
                                  right: 20),
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
                    ],
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
                          return EGBankDeposit();
                        },),);
                      }else if(option == widget.options[1]){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return AhlyBankDeposit();
                        },));
                      }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ArabAfricanBankDeposit();
                        },));
                      }
                    },
                    child: Text('Select Bank',style: TextStyle(color: Colors.white,fontSize: 16),),
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
