import 'dart:io';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ConfirmDeposit extends StatefulWidget {
  const ConfirmDeposit({super.key});

  @override
  State<ConfirmDeposit> createState() => _ConfirmDepositState();
}

class _ConfirmDepositState extends State<ConfirmDeposit> {
  String? value;
  var _Image;
  var imagePicker;
  var myFormat = DateFormat('yyyy-MM-d');
  DateTime date = DateTime.now();

  @override
  void initState() {
    imagePicker = new ImagePicker();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Confirm Deposit',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: DottedBorder(
                  color: Colors.blueAccent,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          _Image = null;
                        });
                        try {
                          print('img2');
                          final image = await ImagePicker().pickImage(
                            source: ImageSource.gallery,);
                          if (image == null) return;
                          final imageTemp = File(image.path);
                          setState(() {
                            _Image = imageTemp;
                          });
                        } on PlatformException catch (e) {
                          print('Failed to pick image: $e');
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Center(
                          child: _Image == null?Icon(
                              Icons.add_a_photo_outlined,
                              color: Colors.blueAccent,
                              size: 40,
                            ): Image.file(_Image,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.25,),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Recipt Number',style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.bold),),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    
                    border: InputBorder.none,
                    hintText: 'eg: 1234',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Date Deposited',style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.bold),),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 10,),//top: 10,bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  children:[
                    Expanded(child: Container(child: Text(myFormat.format(date).toString(),style: TextStyle(fontSize: 16),),)),
                    IconButton(
                      style: IconButton.styleFrom(
                        //backgroundColor: Colors.blueAccent,
                        minimumSize: Size(40, 50),
                        maximumSize: Size(40, 50),
                      ),
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2020, 8),
                            lastDate: DateTime.now());
                        setState(() {
                          date = picked ?? DateTime.now();
                        });
                    }, icon: Icon(Icons.calendar_month_rounded),),
                  ],
                ),
              ),
              //Divider(height: 1,color: Colors.grey[600],thickness: 1,),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Amount Deposited',style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.bold),),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],

                    border: InputBorder.none,
                    hintText: 'Enter amount',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Please allow 1 working day after funds receipt to credit amounts to your wallet.',style: TextStyle(fontSize: 16,color: Colors.grey[500]),),
              ),
              Container(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      child: const Text('Send details',style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0066FF),

                      ),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return ConfirmDeposit();
                        // },));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
