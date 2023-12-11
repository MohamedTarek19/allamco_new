import 'dart:async';

import 'package:allamco_project/bussiness_logic/cubits/property_cubit/property_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  String action = "START";
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyCubit, PropertyState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            centerTitle: true,
            title: Text(
              'Cart (${context.read<PropertyCubit>().Cart.length})',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.92,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: ListView.builder(
                      itemCount: context.read<PropertyCubit>().Cart.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey[400]!)),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.36,
                          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.12,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                        '${context.read<PropertyCubit>().Cart[index].Images!.first}',
                                        height: MediaQuery.of(context).size.height * 0.0,
                                        width: MediaQuery.of(context).size.height * 0.12,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 5),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.542,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 0, bottom: MediaQuery.of(context).size.height * 0.01),
                                              child: Text(
                                                context.read<PropertyCubit>().Cart[index].title ?? '',
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Monthly Rent',
                                                          style: TextStyle(color: Colors.grey[400], fontSize: 12),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Icon(
                                                          Icons.info_outline,
                                                          size: 12,
                                                          color: Colors.grey[400],
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.25,
                                                      child: Text(
                                                        '${context.read<PropertyCubit>().Cart[index].monthlyRent} EGP',
                                                        style: TextStyle(fontSize: 12),
                                                        textAlign: TextAlign.start,
                                                      ),
                                                    ),
                                                  ],
                                                  //    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Appreciation',
                                                          style: TextStyle(color: Colors.grey[400], fontSize: 12),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Icon(
                                                          Icons.info_outline,
                                                          size: 12,
                                                          color: Colors.grey[400],
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.25,
                                                      child: Text(
                                                        '${((context.read<PropertyCubit>().Cart[index].annualAppreciation ?? 0) / 100) * (context.read<PropertyCubit>().Cart[index].propertyPrice ?? 0)} EGP',
                                                        style: TextStyle(fontSize: 12),
                                                        textAlign: TextAlign.start,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              StatefulBuilder(
                                builder: (BuildContext context, void Function(void Function()) setState) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              double rent = double.tryParse(context.read<PropertyCubit>().Cart[index].rent!.text) ?? 0;
                                              if (rent - 200 <= 2000) {
                                                rent = 2000;
                                              } else {
                                                rent = rent - 200;
                                              }
                                              context.read<PropertyCubit>().Cart[index].rent!.text = rent.toString();
                                            },
                                            onLongPress: () {
                                              double rent = double.tryParse(context.read<PropertyCubit>().Cart[index].rent!.text) ?? 0;
                                              setState(() {
                                                timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
                                                  if (rent - 200 <= 2000) {
                                                    rent = 2000;
                                                  } else {
                                                    rent = rent - 200;
                                                  }
                                                  context.read<PropertyCubit>().Cart[index].rent!.text = rent.toString();
                                                });
                                              });
                                            },
                                            onLongPressEnd: (detail) {
                                              setState(() {
                                                timer?.cancel();
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(right: 5),
                                              height: 50,
                                              decoration: BoxDecoration(
                                                //color: Colors.green,
                                                border: Border.all(color: Colors.grey[300]!),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.grey[500],
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: LayoutBuilder(
                                            builder: (BuildContext context, BoxConstraints constraints) {
                                              return Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  //color: Colors.red,
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: Colors.grey[300]!),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'EGP',
                                                      style: TextStyle(fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      width: constraints.maxWidth * 0.5,
                                                      child: TextField(
                                                        keyboardType: TextInputType.number,
                                                        controller: context.read<PropertyCubit>().Cart[index].rent,
                                                        decoration: InputDecoration(border: InputBorder.none),
                                                        onChanged: (value) {
                                                          print(value);
                                                          if (double.tryParse(value) == null) {
                                                            context.read<PropertyCubit>().Cart[index].rent!.text = "2000";
                                                          } else if ((double.tryParse(value) ?? 0) < 2000) {
                                                            context.read<PropertyCubit>().Cart[index].rent!.text = "2000";
                                                          } else if ((double.tryParse(value) ?? 0) > (context.read<PropertyCubit>().Cart[index].propertyPrice ?? 0) * 0.8) {
                                                            context.read<PropertyCubit>().Cart[index].rent!.text = ((context.read<PropertyCubit>().Cart[index].propertyPrice ?? 0) * 0.8).toString();
                                                          }
                                                        },
                                                        onTapOutside: (event) {
                                                          FocusScope.of(context).requestFocus(new FocusNode());
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              double rent = double.tryParse(context.read<PropertyCubit>().Cart[index].rent!.text) ?? 0;
                                              if (rent + 200 >= (context.read<PropertyCubit>().Cart[index].propertyPrice ?? 0) * 0.8) {
                                                rent = (context.read<PropertyCubit>().Cart[index].propertyPrice ?? 0) * 0.8;
                                              } else {
                                                rent += 200;
                                              }
                                              context.read<PropertyCubit>().Cart[index].rent!.text = rent.toString();
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 5),
                                              height: 50,
                                              decoration: BoxDecoration(
                                                //color: Colors.green,
                                                border: Border.all(color: Colors.grey[300]!),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.grey[500],
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                            onLongPress: () {
                                              double rent = double.tryParse(context.read<PropertyCubit>().Cart[index].rent!.text) ?? 0;
                                              setState(() {
                                                timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
                                                  if (rent + 200 >= (context.read<PropertyCubit>().Cart[index].propertyPrice ?? 0) * 0.8) {
                                                    rent = (context.read<PropertyCubit>().Cart[index].propertyPrice ?? 0) * 0.8;
                                                  } else {
                                                    rent += 200;
                                                  }
                                                  context.read<PropertyCubit>().Cart[index].rent!.text = rent.toString();
                                                });
                                              });
                                            },
                                            onLongPressEnd: (detail) {
                                              setState(() {
                                                timer?.cancel();
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              ElevatedButton(
                                onPressed: () {
                                 // context.read<PropertyCubit>().RemovePropertyToCart(property: context.read<PropertyCubit>().Cart[index]);
                                },
                                child: Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 17),),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff0066FF),
                                  elevation: 5,
                                  //side: BorderSide(color: Colors.black),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<PropertyCubit>().RemovePropertyToCart(property: context.read<PropertyCubit>().Cart[index]);
                                },
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.restore_from_trash_outlined,color: Colors.black,),
                                    Text('Remove from cart',style: TextStyle(color: Colors.black,fontSize: 16),),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  side: BorderSide(color: Colors.black),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
