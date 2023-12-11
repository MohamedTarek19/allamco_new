import 'dart:math';
import 'package:allamco_project/presentation/screens/properties_screens/properities_screen.dart';
import 'package:allamco_project/presentation/screens/wallet_screens/wallet_main.dart';
import 'package:allamco_project/presentation/test_animated_text.dart';
import 'package:flutter/material.dart';

import 'properties_screens/cart_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  String data = '';
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Properities',
      style: optionStyle,
    ),
    Text(
      'Wallet',
      style: optionStyle,
    ),
    Text(
      'Market Place',
      style: optionStyle,
    ),
    Text(
      'Cart',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];
  int _selectedIndex = 0;
  void selectPage(int index){
    setState(() {
      _selectedIndex = index;
    });
    if(_selectedIndex == 2){
      String d = 'Get Data';
      data = '';
      int count = 0;
      Future.delayed(Duration(seconds: 1)).then((value) {
        setState(() {
          data = d;
          print(data);
        });
      });
    }

  }
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      ProperitiesScreen(title: _widgetOptions[0],),
      WalletMain(title: _widgetOptions[1],),
      Placeholder(),
      CartScreen(),
      Placeholder(child: _widgetOptions[4],),
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xffffffff),
          Color(0xffeeeeee),
          Color(0xffeeeef1),
        ], transform: GradientRotation(pi / 2)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: screens[_selectedIndex],
        //Container(height: double.infinity,width: double.infinity,child: Center(child: Text(data,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blueAccent,),),),),//screens[_selectedIndex],

        bottomNavigationBar: BottomNavigationBar(
          type : BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedFontSize: 10,
          unselectedFontSize:12 ,
          onTap: selectPage,
          selectedItemColor:Colors.black,
          unselectedItemColor: Colors.grey,
          elevation: 9,
          items: const [
            BottomNavigationBarItem(
              label: 'Properities',
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Wallet',
              icon: Icon(Icons.wallet),
            ),
            BottomNavigationBarItem(
              label: 'Market Place',
              icon: Icon(Icons.storefront),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(Icons.shopping_cart),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.portrait),
            ),

          ],
        ),
      ),
    );
  }
}
