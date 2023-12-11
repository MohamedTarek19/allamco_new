import 'dart:math';
import 'package:allamco_project/bussiness_logic/cubits/property_cubit/property_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:allamco_project/models/property_model.dart';
import 'package:allamco_project/presentation/screens/properties_screens/cart_screen.dart';
import 'package:allamco_project/presentation/screens/properties_screens/property_screens/images_screen.dart';
import 'package:allamco_project/presentation/widgets/data_item.dart';
import 'package:allamco_project/presentation/widgets/details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:sliver_tools/sliver_tools.dart';

class PropertyItemScreen extends StatelessWidget {
  PropertyItemScreen({
    super.key,
    required this.proprety,
  });

  final oCcy = NumberFormat("#,##0.00", "en_US");

  late ScrollController controller = ScrollController();
  PropertyModel proprety;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = proprety.Images!
        .map(
          (item) => ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5),
              topLeft: Radius.circular(5),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Image.asset(
                item,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ),
        )
        .toList();
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            //alignment: Alignment.center,
            children: [
              CustomScrollView(
                physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                reverse: false,
                controller: controller,
                slivers: [
                  SliverStack(insetOnOverlap: true, children: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Container(
                          height: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height * 0.87 : MediaQuery.of(context).size.height * 1.1,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              //example spacing#####################################################################
                              //                                        [image slider]
                              //####################################################################################
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height * 0.35 : MediaQuery.of(context).size.height * 0.59,
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    viewportFraction: 1,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 10.6,
                                    disableCenter: true,
                                  ),
                                  items: imageSliders,
                                ),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height * 0.32 : MediaQuery.of(context).size.height * 0.54,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0, left: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20),
                                    elevation: 5,
                                    child: Container(
                                      height: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height * 0.54 : MediaQuery.of(context).size.height * 0.56,
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.grey[400]!,
                                          width: 0.5,
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8.0, left: 8),
                                            child: IntrinsicHeight(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) {
                                                              return ImagesScreen(
                                                                Images: proprety.Images ?? [],
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        child: Row(
                                                          mainAxisAlignment: MediaQuery.of(context).orientation == Orientation.landscape ? MainAxisAlignment.center : MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            const Icon(
                                                              Icons.image_outlined,
                                                              color: Color(0xff0066FF),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              '${proprety.Images?.length ?? 0} Images',
                                                              style: const TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    width: 2,
                                                    thickness: 2,
                                                    indent: 6,
                                                    endIndent: 6,
                                                    color: Colors.grey[300],
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        height: 30,
                                                        child: Row(
                                                          mainAxisAlignment: MediaQuery.of(context).orientation == Orientation.landscape ? MainAxisAlignment.center : MainAxisAlignment.end,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Transform(
                                                                  transform: Matrix4.rotationY(pi / 2.7),
                                                                  child: const Icon(
                                                                    Icons.crop_square,
                                                                    color: Color(0xff0066FF),
                                                                  ),
                                                                ),
                                                                Transform.scale(
                                                                  scaleX: 0.8,
                                                                  origin: const Offset(0, 0),
                                                                  child: const Icon(
                                                                    Icons.crop_square,
                                                                    color: Color(0xff0066FF),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            const Text(
                                                              'Virtual tour',
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                            child: Center(
                                              child: Text(
                                                'Property price',
                                                style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 8),
                                            child: Center(
                                                child: Text(
                                              '${oCcy.format(proprety.propertyPrice ?? 0)}',
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color: Color(0xff0066FF)),
                                            )),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: MediaQuery.of(context).size.width * 0.27,
                                              right: MediaQuery.of(context).size.width * 0.27,
                                              bottom: 10,
                                            ),
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                border: Border.all(
                                                  color: Colors.grey[400]!,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${proprety.Investors} investors',
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          //example spacing#####################################################################
                                          //                                        [funding progress]
                                          //####################################################################################
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 8),
                                            child: LinearProgressIndicator(
                                              minHeight: 8,
                                              value: 0.26,
                                              color: Color(0xff0066FF),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${0.26 * 100}% funded',
                                                style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, color: Color(0xff0066FF), fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                '${oCcy.format((proprety.propertyPrice ?? 0) - (proprety.funding ?? 0) * (proprety.propertyPrice ?? 0))} EGP available',
                                                style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, color: Colors.grey[400], fontWeight: FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          //example spacing#####################################################################
                                          //                                        [invest details]
                                          //####################################################################################
                                          MediaQuery.of(context).size.height > 400
                                              ? Container(
                                                  margin: const EdgeInsets.only(top: 5),
                                                  padding: const EdgeInsets.only(top: 10, bottom: 5, right: 10, left: 10),
                                                  height: MediaQuery.of(context).size.height > 600 ? MediaQuery.of(context).size.height * 0.19 : MediaQuery.of(context).size.height * 0.14,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color: Colors.grey[200],
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.017),
                                                        child: dataItem(title: 'Annualised return', percent: '${proprety.annualReturn}%'),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.017),
                                                        child: dataItem(title: 'Annual appreciation', percent: '${proprety.annualAppreciation}%'),
                                                      ),
                                                      MediaQuery.of(context).size.height > 600
                                                          ? Column(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.017),
                                                                  child: dataItem(title: 'Projected gross yield', percent: '${proprety.projectedGross}%'),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                    bottom: 0,
                                                                  ),
                                                                  //MediaQuery.of(context).size.height * 0.017),
                                                                  child: dataItem(title: 'Projected net yield', percent: '${proprety.projectedNet}%'),
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
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        //example spacing#####################################################################
                        //                                        [list body data]
                        //####################################################################################
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Text(
                                  proprety.title ?? '',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      '1 bed',
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '1 bath',
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '965.2 sq.ft',
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 100,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                height: 100,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                height: 100,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                height: 100,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                height: 100,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                height: 100,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                height: 100,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    SliverLayoutBuilder(
                      builder: (BuildContext context, SliverConstraints constraints) {
                        return SliverAppBar(
                          floating: true,
                          automaticallyImplyLeading: true,
                          pinned: true,
                          snap: true,
                          elevation: 0,
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 0,
                              borderRadius: BorderRadius.circular(100),
                              child: IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: const Size(40, 40),
                                  maximumSize: const Size(40, 40),
                                ),
                                icon: const Center(
                                    child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 18,
                                )),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                          actions: [],
                          scrolledUnderElevation: 0.0,
                          backgroundColor: constraints.scrollOffset > MediaQuery.of(context).size.height * 0.16 ? Colors.white : Colors.transparent,
                        );
                      },
                    ),
                  ]),
                ],
              ),
              //example spacing#####################################################################
              //                                        [cart button]
              //####################################################################################
              Positioned(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                bottom: MediaQuery.of(context).size.height * 0.06,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Material(
                    borderRadius: BorderRadius.circular(5),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: 5,
                        right: 5,
                        left: 7,
                        top: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2000 EGP',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          BlocBuilder<PropertyCubit, PropertyState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff0066FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  context.read<PropertyCubit>().addPropertyToCart(property: proprety);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return CartScreen();
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
