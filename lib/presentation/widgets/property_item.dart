import 'package:allamco_project/presentation/screens/payment_screens/payment_methods.dart';
import 'package:allamco_project/presentation/screens/properties_screens/property_screens/property_item_screen.dart';
import 'package:allamco_project/presentation/screens/payment_screens/payment_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({
    super.key,
    required this.imgList,
    required this.title,
    required this.fund,
    required this.percentage,
    required this.data1,
    required this.data2,
    required this.data3,
    required this.data4,
    required this.index,
    required this.tag,
  });

  final String tag;
  final List<String> imgList;
  final String title;
  final int index;

  final String fund;

  final double percentage;

  final Widget data1;

  final Widget data2;

  final Widget data3;

  final Widget data4;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map(
          (item) => ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              item,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ],
        ),
      ),
    )
        .toList();
    TextStyle optionStyle = TextStyle(
        fontSize: MediaQuery.of(context).size.height > 600 ? 15 : 14,
        fontWeight: FontWeight.bold,);

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 8.0,
          right: 8,
          left: 8,
        ),
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.68,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height > 790
                                  ? MediaQuery.of(context).size.height * 0.35
                                  : MediaQuery.of(context).size.height * 0.3,
                              child: Container(
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    aspectRatio:
                                        MediaQuery.of(context).size.width *
                                            0.9 /
                                            MediaQuery.of(context).size.height *
                                            0.35,
                                    viewportFraction: 1,
                                    enlargeCenterPage: true,
                                  ),
                                  items: imageSliders,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //notify Widget+++++++++++++++++++++++++++++++++++++++++
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: const Center(
                          child: Text(
                        'Save 20% right now!',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    //details Widget+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  ],
                ),
                LayoutBuilder(
                  builder: (BuildContext context,
                      BoxConstraints floatingBoxConstraints) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                      child: SizedBox(
                        height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait &&
                                MediaQuery.of(context).size.height < 790
                            ? MediaQuery.of(context).size.height * 0.34
                            : MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 7,
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height < 790?
                              MediaQuery.of(context).size.height*0.114:
                              MediaQuery.of(context).orientation ==
                                  Orientation.portrait?
                              MediaQuery.of(context).size.height*0.1:
                              MediaQuery.of(context).size.height*0.08
                              ,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      title,
                                      style: optionStyle,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return PaymentMethodsScreen();
                                      },),);
                                    },
                                    child: Text('Buy now!',style: TextStyle(color: Colors.white,fontSize: 13,fontFamily: 'jaldi'),),
                                    style: TextButton.styleFrom(
                                      minimumSize: Size(MediaQuery.of(context).size.width <350? 76:100, 35),
                                      maximumSize: Size(MediaQuery.of(context).size.width <350? 76:100, 35),
                                      backgroundColor: Color(0xff0066ff),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  fund,
                                  style: const TextStyle(
                                    fontSize: 14,
                                      color: Color(0xff0066FF),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${percentage * 100}% funded',
                                  style: TextStyle(
                                    fontSize: 14,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            LinearProgressIndicator(
                              minHeight: 5,
                              value: percentage,
                              color: Color(0xff0066FF),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.023,
                            ),
                            //detect screen size for data box
                            MediaQuery.of(context).size.height > 400
                                ? Container(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 5,
                                        right: 10,
                                        left: 10),
                                    height:
                                        MediaQuery.of(context).size.height > 600
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.142
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.11,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey[200],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.001),
                                          child: data1,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.001),
                                          child: data2,
                                        ),
                                        MediaQuery.of(context).size.height > 600
                                            ? Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.001),
                                                    child: data3,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.001),
                                                    child: data4,
                                                  ),
                                                ],
                                              )
                                            : Container(
                                                height: 0,
                                              ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    height: 0,
                                  ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
