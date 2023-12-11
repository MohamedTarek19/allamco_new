import 'package:allamco_project/presentation/screens/payment_screens/banking_payment/confirm_deposit.dart';
import 'package:flutter/material.dart';

class AhlyBankDeposit extends StatelessWidget {
  const AhlyBankDeposit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.92,
        //color: Colors.red,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20,bottom: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Bank Deposite',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Proceed to the nearest National Bank of Egypt branch and make a deposit with the following details, then confirm transfer on our app',style: TextStyle(fontSize: 16,color: Colors.grey[700]),),
                      ),
                      //########################################
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text('Bank Name',style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          alignment: Alignment.centerLeft,
                          height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300]
                            ),
                            child: Text('National Bank of Egypt',style: TextStyle(fontSize: 16,color: Colors.grey[700]),)),
                      ),
                      //Divider(height: 20,),
                      //########################################
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('Beneficiary Name',style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerRight,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]
                            ),
                            child: Text('علامكو المحدودة للتطوير العقاري',style: TextStyle(fontSize: 16,color: Colors.grey[700]),textDirection: TextDirection.rtl,)),
                      ),
                      //Divider(height: 20,),
                      //########################################
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('Beneficiary Address',style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                            padding: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]
                            ),
                            child: Text('فيلا 109 جنوب الأكاديمية منطقة (ز) التجمع الخامس',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 16,color: Colors.grey[700]),)),
                      ),
                      //Divider(height: 20,),
                      //########################################
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('Beneficiary Account Number',style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]
                            ),
                            child: Text('0853071170055001013',style: TextStyle(fontSize: 16,color: Colors.grey[700]),)),
                      ),
                      //Divider(height: 20,),
                      //#######################################
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Please keep a photo of your receipt to confirm your deposit. '
                            'The amount will be credited within 1 working days after funds receipt.'
                            '\nPlease note that ATM deposits are not supported.',
                          style: TextStyle(fontSize: 14,color: Colors.red),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      child: Text('Confirm',style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0066FF),

                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ConfirmDeposit();
                        },));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
