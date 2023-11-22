import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/Routes/routes.dart';

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
          390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.transparent
          )
        ),
        debugShowCheckedModeBanner: false,
        initialRoute:"/",
        onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),

      ),
    );
  }
}