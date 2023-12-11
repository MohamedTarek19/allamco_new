import 'package:allamco_project/presentation/screens/signup_screens/phone_screen.dart';
import 'package:allamco_project/presentation/widgets/custom_dropdown.dart';
import 'package:allamco_project/presentation/widgets/custom_formfield.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPass = TextEditingController();
  bool obsecure = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                //color: Colors.red,
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 22,),
                          custom_formfield(controller: name,title: 'Full Name',
                            isNumber: false,
                            isPhone: false,
                            Validator: (value) {
                            if(value == null|| value.isEmpty){
                              return 'please enter your name';
                            }
                            else if(value.contains(RegExp(r'[0-9]'))){
                              return "your name shouldn't contain numbers";
                            }else if(!value.contains(' ')){
                              return 'you should separate your name!';
                            }
                            return null;
                          },),

                          const SizedBox(height: 22,),

                          custom_formfield(controller: Email,title: 'Email Address',
                            isNumber: false,
                            isPhone: false,
                            Validator: (value) {
                              if(value == null|| value.isEmpty){
                                return 'please enter your name';
                              }
                              else if(value.contains(RegExp(r'[0-9]'))){
                                return "your name shouldn't contain numbers";
                              }else if(!value.contains(' ')){
                                return 'you should separate your name!';
                              }
                              return null;
                            },),

                          const SizedBox(height: 22,),

                          custom_formfield(controller: userName,title: 'User name',
                            isNumber: false,
                            isPhone: false,
                            suffix: const Icon(Icons.error_outline, color: Colors.red,),
                            Validator: (value) {
                              if(value == null|| value.isEmpty){
                                return 'please enter your name';
                              }
                              else if(value.contains(RegExp(r'[0-9]'))){
                                return "your name shouldn't contain numbers";
                              }else if(!value.contains(' ')){
                                return 'you should separate your name!';
                              }
                              return null;
                            },),
                          const SizedBox(height: 22,),
                          StatefulBuilder(
                            builder: (BuildContext context, void Function(void Function()) setState) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  custom_formfield(controller: Password,title: 'Password',
                                    isNumber: false,
                                    isPhone: false,
                                    obsecure: obsecure,
                                    suffix: Padding(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      child: InkWell(onTap: (){setState((){obsecure = !obsecure;});},child: obsecure?const Icon(Icons.visibility_outlined):const Icon(Icons.visibility_off_outlined)),
                                    ),
                                    Validator: (value) {
                                      var temp = value?.split('');
                                      if(value == null || value.isEmpty){
                                        return 'please enter your password';
                                      }
                                      else if(!value.contains(RegExp(r'[0-9]'))||!value.contains(RegExp(r'[a-z]'))||!value.contains(RegExp(r'[A-Z]'))){
                                        return "your password should contain four small letters,\ncapital letters and four numbers";
                                      }else if((temp?.where((element) => element.contains(RegExp(r'[0-9]'))).length??0) < 4||
                                          (temp?.where((element) => element.contains(RegExp(r'[a-z]'))).length??0) <4 ||
                                          (temp?.where((element) => element.contains(RegExp(r'[A-Z]'))).length??0) <4
                                      ){
                                        return "your password should contain four small letters,\ncapital letters and four numbers";
                                      }
                                      return null;
                                    },),
                                  const SizedBox(height: 30,),

                                  custom_formfield(controller: ConfirmPass,title: 'Confirm Password',
                                    isNumber: false,
                                    obsecure: obsecure,
                                    isPhone: false,
                                    Validator: (value) {
                                      if(value != Password.text){
                                        return 'your Password doesn\'t match';
                                      }
                                      return null;
                                    },),
                                ],
                              );
                            },
                          ),



                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,top: 20),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: const Text('Nationality:',textAlign: TextAlign.start,)),
                          ),
                          CustomDropDown(
                            value: '',
                            list: const [''],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,top: 20),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: const Text('Country:')),
                          ),
                          CustomDropDown(
                            value: '',
                            list: const [''],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black)
                ),
                child: TextButton(
                  onPressed: (){
                    // if(_formKey.currentState!.validate()){
                    //
                    // }
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                      return PhoneNumberScreen();
                    }));

                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(MediaQuery.of(context).size.width*0.4, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                  ),
                  child: const Text('Next',style: TextStyle(color: Colors.black,fontSize: 18),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

