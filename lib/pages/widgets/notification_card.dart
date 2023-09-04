import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final IconData icon; // Change from String to IconData
  // final Function onpress;

  const NotificationCard({
    required this.title,
    required this.icon, // Change from String to IconData
    //required this.onpress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return SafeArea(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(4),
          width: 337.w,
          height: 64.9.h,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFC67C4E)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 12.w),
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFC67C4E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon, // Use the dynamic icon here
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
