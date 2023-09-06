import 'package:coffee_ui/pages/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:coffee_ui/route/route.dart' as route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.light),
          onGenerateRoute: route.controller,
          initialRoute: route.onBoardingPage,
        );
        // return GetMaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   //home: OrderAccepted(),
        //   theme: ThemeData(brightness: Brightness.light),
        //   //home: child,
        //   onGenerateRoute: route.controller,
        // );
      },
      //child: const OnboardingScreen(),
    );
  }
}
