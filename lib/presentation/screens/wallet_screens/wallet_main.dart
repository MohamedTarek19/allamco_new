import 'package:flutter/material.dart';

class WalletMain extends StatelessWidget {
  WalletMain({super.key, required this.title});

  Widget title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: title,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.92,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(right: 15, left: 15, top: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'My wallet',
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    padding: const EdgeInsets.only(left: 20,top: 30,right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[300],
                    ),
                    child: const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Balance',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                           Center(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '75,000',
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text('  egp',style: TextStyle(
                                          fontSize: 18,),
                           ),
                                    ],
                                  ),
                               ],
                             ),
                           ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  const Text(
                    'Next payment due:',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '1 march 2023',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Text(
                        '42,500 egp',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04,left: MediaQuery.of(context).size.width*0.01,right: MediaQuery.of(context).size.width*0.01),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0066FF),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        maximumSize: Size(MediaQuery.of(context).size.width*0.6, 60),
                        minimumSize: Size(MediaQuery.of(context).size.width*0.6, 60),
                      ),
                      onPressed: () {

                      },
                      child: Text('Deposit',style: TextStyle(color: Colors.white,fontSize: 16),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01,left: MediaQuery.of(context).size.width*0.01,right: MediaQuery.of(context).size.width*0.01),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xaaaaaaaa),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        maximumSize: Size(MediaQuery.of(context).size.width*0.6, 60),
                        minimumSize: Size(MediaQuery.of(context).size.width*0.6, 60),
                      ),
                      onPressed: () {

                      },
                      child: Text('Withdraw',style: TextStyle(color: Colors.white,fontSize: 16),),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
