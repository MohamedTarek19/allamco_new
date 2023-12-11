
import 'package:flutter/material.dart';

class InstaPayScreen extends StatelessWidget {
  const InstaPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.92,
        margin: const EdgeInsets.only(top: 20),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 20, right: 15, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Instapay',style: TextStyle(fontSize: 17),),
                        const Text('Send money to bank account',style: TextStyle(fontSize: 18),),
                        dataTile(title: 'Bank name',data: 'National Bank Of Egypt',),
                        dataTile(title: 'Account no.',data: '0853071170055001013',),
                        dataTile(title: 'IBAN no.',data: 'EG470003008530711700550010130',),
                        dataTile(title: 'Reciever Name',data: 'علامكو المحدودة للتطوير العقاري',direction: TextDirection.rtl,),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.09,left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0066FF),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    maximumSize: Size(MediaQuery.of(context).size.width*0.6, 50),
                    minimumSize: Size(MediaQuery.of(context).size.width*0.6, 50),
                  ),
                  onPressed: () {

                  },
                  child: const Text('Confirm Transfer',style: TextStyle(color: Colors.white,fontSize: 16),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class dataTile extends StatelessWidget {
  dataTile({
    super.key,
    required this.title,
    required this.data,
    this.direction,
  });
  String title;
  String data;
  TextDirection? direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
      //height: MediaQuery.of(context).size.height*0.06,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(

        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width:MediaQuery.of(context).size.width*0.33,child: Text(title,style: const TextStyle(fontSize: 14),)),
          SizedBox(width:MediaQuery.of(context).size.width*0.46,child: Text(data,style: const TextStyle(fontSize: 14),textDirection: direction,),),
        ],
      ),
    );
  }
}

