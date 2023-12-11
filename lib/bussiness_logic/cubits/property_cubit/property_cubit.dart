import 'package:allamco_project/models/property_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  PropertyCubit() : super(PropertyInitial());
  List<PropertyModel> properties = [];
  List<PropertyModel> Cart = [];
  List<PropertyModel> WishList = [];

  void initailizeProperty(){
    properties.add(PropertyModel(
      title: 'Citygate Golf Villa',
      Images: [
        'assets/images/property1.png',
        'assets/images/property2.png',
        'assets/images/property3.png',
        'assets/images/property4.png',
        'assets/images/property5.png',
      ],
      funding: 0.4,
      Investors: 300,
      ad: 'Save 20% right now!',
      annualReturn: 9.91,
      annualAppreciation: 6,
      projectedGross: 7.79,
      projectedNet: 5.8,
      area: 500,
      propertyPrice: 10500333,
      remainingDays: 20,
      monthlyRent: 3000
    ));
  }
  void addProperty({required PropertyModel property}){
    properties.add(property);
    emit(PropertyAdded());
  }

  void addPropertyToCart({required PropertyModel property}){
    property.rent = TextEditingController(text: "2000");
    Cart.add(property);
    emit(PropertyAdded());
  }
  void RemovePropertyToCart({required PropertyModel property}){
    Cart.remove(property);
    emit(PropertyAdded());
  }


  void addPropertyToWishList({required PropertyModel property}){
    WishList.add(property);
    emit(PropertyAdded());
  }


}
