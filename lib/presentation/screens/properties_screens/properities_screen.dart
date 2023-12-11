import 'dart:math';
import 'package:allamco_project/presentation/screens/properties_screens/property_screens/property_item_screen.dart';
import 'package:intl/intl.dart';
import 'package:allamco_project/bussiness_logic/cubits/property_cubit/property_cubit.dart';
import 'package:allamco_project/presentation/widgets/custom_dropdown.dart';
import 'package:allamco_project/presentation/widgets/custom_dropdown_icons.dart';
import 'package:allamco_project/presentation/widgets/data_item.dart';
import 'package:allamco_project/presentation/widgets/property_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProperitiesScreen extends StatelessWidget {
  ProperitiesScreen({super.key, required this.title});

  String? Iconval = 'assets/images/egypt (2).png';
  String? val = 'Egypt';
  List<String> countryIcon = [
    'assets/images/egypt (2).png',
    'assets/images/us.png',
    'assets/images/saudi.png',
    'assets/images/emirates.png',
  ];
  final oCcy = NumberFormat("#,##0.00", "en_US");
  List<String> countries = [
    'Egypt',
    'UAE',
    'US',
    'Saudi',
  ];
  static const TextStyle optionStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  Widget title;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              floating: false,
              pinned: false,
              snap: false,
              centerTitle: false,
              stretch: false,
              scrolledUnderElevation: 0.0,
              title: FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  children: [
                    Text(
                      'Available ',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    title,
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: _SliverAppBarDelegate(
                minHeight: 35,
                maxHeight: 35,
                child: Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.transparent,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomDropDownIcons(
                              list: countryIcon,
                              value: Iconval ?? '',
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 3.0, left: 3),
                              child: TextField(
                                decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 9), filled: true, fillColor: Colors.white, hintText: 'Search', hintStyle: TextStyle(fontSize: 14), prefixIcon: Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomDropDown(
                              list: countries,
                              value: val ?? '',
                              margin: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<PropertyCubit, PropertyState>(
              builder: (context, state) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: context.read<PropertyCubit>().properties.length,
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return PropertyItemScreen(proprety: context.read<PropertyCubit>().properties[index],);
                            },),);
                          },
                          child: PropertyItem(
                            tag: 'tag$index',
                            index: index,
                            imgList: context.read<PropertyCubit>().properties[index].Images ?? [],
                            title: context.read<PropertyCubit>().properties[index].title ?? '',
                            percentage: context.read<PropertyCubit>().properties[index].funding ?? 0,
                            data1: dataItem(
                              title: 'Annualised return',
                              percent: '${context.read<PropertyCubit>().properties[index].annualReturn}%',
                            ),
                            data2: dataItem(
                              title: 'Annual appreciation',
                              percent: '${context.read<PropertyCubit>().properties[index].annualAppreciation}%',
                            ),
                            data3: dataItem(
                              title: 'Projected gross yield',
                              percent: '${context.read<PropertyCubit>().properties[index].projectedGross}%',
                            ),
                            data4: dataItem(
                              title: 'Projected net yield',
                              percent: '${context.read<PropertyCubit>().properties[index].projectedNet}%',
                            ),
                            fund: '${oCcy.format((context.read<PropertyCubit>().properties[index].funding??0)*(context.read<PropertyCubit>().properties[index].propertyPrice??0))} LE',
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
