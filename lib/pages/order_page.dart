import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: Color(0xFFC67C4E),
                    size: 35,
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    'Order Placed Successfully!',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color(0xFFC67C4E),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Sora',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const Divider(
                thickness: 1.5,
                color: Color(0xFFC67C4E),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text(
                    'Your Orders',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF8D8D8D),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Sora',
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Icon(
                    Icons.archive_rounded,
                    color: Color(0xFFC67C4E),
                    size: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 190.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFC67C4E),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.library_add,
                                    color: Color(0xFFC67C4E),
                                    size: 23,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Order No : ',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color(0xFF7D7463),
                                      fontFamily: 'Sora',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const PopupMenuItem<String>(
                                value: 'pending',
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.error,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(width: 8),
                                    Text('Pending'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.border_color,
                                color: Color(0xFFC67C4E),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Item Name : ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF7D7463),
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.coffee,
                                color: Color(0xFFC67C4E),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Item Size    : ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF7D7463),
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.numbers,
                                color: Color(0xFFC67C4E),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Quantity      : ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF7D7463),
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 190.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFC67C4E),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.library_add,
                                    color: Color(0xFFC67C4E),
                                    size: 23,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Order No : ',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color(0xFF7D7463),
                                      fontFamily: 'Sora',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const PopupMenuItem<String>(
                                value: 'pending',
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.error,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(width: 8),
                                    Text('Pending'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.border_color,
                                color: Color(0xFFC67C4E),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Item Name : ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF7D7463),
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.coffee,
                                color: Color(0xFFC67C4E),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Item Size    : ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF7D7463),
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.numbers,
                                color: Color(0xFFC67C4E),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Quantity      : ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF7D7463),
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 190.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFC67C4E),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.library_add,
                                    color: Color(0xFFC67C4E),
                                    size: 23,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Order No : ',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color(0xFF7D7463),
                                      fontFamily: 'Sora',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const PopupMenuItem<String>(
                                value: 'pending',
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.error,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(width: 8),
                                    Text('Pending'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.border_color,
                                color: Color(0xFFC67C4E),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Item Name : ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF7D7463),
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.coffee,
                                color: Color(0xFFC67C4E),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Item Size    : ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF7D7463),
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.numbers,
                                color: Color(0xFFC67C4E),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Quantity      : ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF7D7463),
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 190.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFC67C4E),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.library_add,
                                    color: Color(0xFFC67C4E),
                                    size: 23,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Order No : ',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color(0xFF7D7463),
                                      fontFamily: 'Sora',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const PopupMenuItem<String>(
                                value: 'pending',
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.error,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(width: 8),
                                    Text('Pending'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.border_color,
                                color: Color(0xFFC67C4E),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Item Name : ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF7D7463),
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.coffee,
                                color: Color(0xFFC67C4E),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Item Size    : ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF7D7463),
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.numbers,
                                color: Color(0xFFC67C4E),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Quantity      : ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF7D7463),
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
