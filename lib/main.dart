import 'package:bookly_app/config/navigation/route_constants.dart';
import 'package:bookly_app/config/navigation/route_generator.dart';
import 'package:bookly_app/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: Size(375, 812),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generate,
        initialRoute: RouteConstants.splashRoute,
      ),
    );
  }
}
