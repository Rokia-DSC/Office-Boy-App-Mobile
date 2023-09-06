import 'package:coffee_ui/pages/widgets/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
//import 'order_page.dart';
import 'package:coffee_ui/route/route.dart' as route;

class OrderAccepted extends StatelessWidget {
  const OrderAccepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Order Received',
          style: TextStyle(
            fontFamily: 'Sora',
            color: const Color(0xFF2F2D2C),
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
            // Get.back();
            Navigator.popAndPushNamed(context, route.homePage);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF2F2D2C),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.0.h),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(150.r), // Image radius
                  child: Image.asset(
                    'assets/images/orderSuccess.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Congratulations !',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          Text(
            'Your order is accepted ',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            ' Please wait for a while, the order will be prepared within 10 to 15 minutes.',
            style: TextStyle(
              fontSize: 17.sp,
              color: const Color(0xFF9B9B9B),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: 376.w,
        height: 121.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(0.1),
                spreadRadius: 5.r,
                blurRadius: 7.r,
                offset: const Offset(0, 3),
              ),
            ],
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 315.w,
              height: 62.h,
              child: FloatingActionButton(
                backgroundColor: const Color(0xFFC67C4E),
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0.r)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, route.homePage);
                  // Get.to(const HomePage());
                  // Navigator.push(
                  //   context,
                  //   // MaterialPageRoute(builder: (context) => const OrderPage()),
                  //   MaterialPageRoute(builder: (context) => const HomePage()),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
