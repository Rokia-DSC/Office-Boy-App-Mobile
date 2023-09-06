import 'package:coffee_ui/pages/signin_page.dart';
import 'package:coffee_ui/pages/widgets/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:coffee_ui/route/route.dart' as route;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnboardingScreenComponents(
      description: 'The best grain, the finest roast, the powerful flavor.',
      title: 'Coffee so good, your taste buds will love it.',
      imagePath: 'assets/images/splash_image.png',
    );
  }
}

class OnboardingScreenComponents extends StatefulWidget {
  const OnboardingScreenComponents(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.description})
      : super(key: key);
  final String imagePath, title, description;

  @override
  State<OnboardingScreenComponents> createState() =>
      _OnboardingScreenComponentsState();
}

class _OnboardingScreenComponentsState
    extends State<OnboardingScreenComponents> {
  late String finalEmail;

  Future<bool> getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail ?? '';
    });
    if (kDebugMode) {
      print(finalEmail);
    }
    return finalEmail.isNotEmpty;
  }
  //
  // @override
  // void initState() {
  //   getValidationData().whenComplete(() async {
  //     Get.to(finalEmail == null ? const SignInPage() : const HomePage());
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.imagePath), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 502.r, left: 30.r, right: 30.r),
              child: Text(
                textAlign: TextAlign.center,
                widget.title,
                style: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.r),
              child: Text(widget.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp, color: Colors.white)),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.r),
              child: SizedBox(
                width: 315.w,
                height: 62.h,
                child: ElevatedButton(
                  onPressed: () {
                    getValidationData().then((isEmailObtained) {
                      if (isEmailObtained) {
                        // Navigator.pushNamed(context, route.homePage);
                        // Get.to(const HomePage());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      } else {
                        // Navigator.pushNamed(context, route.signInPage);
                        // Get.to(const SignInPage());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()));
                      }
                    });
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const SignInPage()),
                    // );
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xffC67C4E),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
          ],
        ),
      ),
    );
  }
}
