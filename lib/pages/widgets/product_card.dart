import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../details.dart';

class ProductCard extends StatelessWidget {
  final String title, subtitle, img;
  final bool showAddButton;

  const ProductCard(
      {required this.title,
      required this.subtitle,
      required this.img,
      this.showAddButton = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return SafeArea(
      child: Container(
        //height: 400.h,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailsPage()),
            );
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              Text(
                subtitle,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFF9B9B9B),
                  fontSize: 15.sp,
                ),
              ),
              Container(
                width: 30.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFC67C4E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
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
