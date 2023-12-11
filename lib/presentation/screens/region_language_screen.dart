import 'package:allamco_project/presentation/screens/sign_up&in_screen.dart';
import 'package:allamco_project/presentation/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class RegionLanguageScreen extends StatelessWidget {
  RegionLanguageScreen({
    super.key,
  });

  List<String> Languages = ['Arabic', 'English'];
  List<String> Countries = ['Egypt','Saudi Arabia','Qatar'];
  late String langDropVal;
  late String countriesDropVal;

  @override
  Widget build(BuildContext context) {
    langDropVal = Languages.first;
    countriesDropVal = Countries.first;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        //margin: EdgeInsets.only(left: 5, right: 5),
        width: MediaQuery.of(context).size.width,
        child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.358,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(

                    child: Container(
                      decoration: BoxDecoration(

                      ),
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Image.asset(
                          "assets/images/logo.png",
                        fit: BoxFit.fill,

                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Please select the language of the app:'),
                ),
                CustomDropDown(list: Languages,value: langDropVal,),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0,left: 8),
                  child: Text('Please select the country:'),
                ),
                CustomDropDown(list: Countries,value: countriesDropVal,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20,right: 5,left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xff0066FF))
                        ),
                        child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                return SingUpAndInScreen();
                              }));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff0066FF),
                              minimumSize: Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                            ),
                            child: const Text('Next',style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )


      ),
    );
  }
}




