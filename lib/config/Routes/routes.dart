import 'package:flutter/material.dart';
import 'package:pyment/features/checkout/presentation/pages/cart_view.dart';

import '../../core/utils/components.dart';
import '../../features/detail/presentation/pages/detail_screen.dart';

class Routes{
  static const String cart="/";
  static const String details="details";
}
class AppRoutes{
  static Route onGenerate(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.cart:
        return MaterialPageRoute(builder: (context) {
          return CartView();
        },);
        case Routes.details:
        return MaterialPageRoute(builder: (context) {
          return DetailsScreen();
        },);


        default:
      return MaterialPageRoute(builder: (context)=> unDefineRoute());

    }
  }
}