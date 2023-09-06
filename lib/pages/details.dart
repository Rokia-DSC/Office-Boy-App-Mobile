import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cart_page.dart';
import 'package:readmore/readmore.dart';
import 'package:get/get.dart';
import 'package:coffee_ui/route/route.dart' as route;

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int counter = 1;

  void incrementCounter() {
    setState(() {
      if (counter <= 4) {
        counter++;
      }
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 1) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
                // Get.back();
                Navigator.popAndPushNamed(context, route.homePage);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF2F2D2C),
              )),
          title: Text(
            'Detail',
            style: TextStyle(
                fontFamily: 'Sora',
                color: const Color(0xFF2F2D2C),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              color: Colors.black,
              onPressed: () {},
            )
          ]),
      body: Padding(
        padding: EdgeInsets.only(right: 30.r, left: 30.r, top: 25.r),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 315.w,
                height: 226.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Rectangle 1706.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.r),
                        child: Text(
                          'Cappuccino',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.r, bottom: 16.r),
                        child: Text(
                          'with Chocolate',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 12.sp,
                              color: const Color(0xFF9B9B9B),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 12.r),
                        child: Image.asset('assets/images/bean.png'),
                      ),
                      Image.asset('assets/images/milk.png'),
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 20.r)),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.r, bottom: 12.r),
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.r),
                child: ReadMoreText(
                  'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk  , A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk .. ',
                  trimLines: 5,
                  colorClickableText: const Color(0xFFC67C4E),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFC67C4E),
                  ),
                  style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF9B9B9B),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: 376.w,
        height: 121.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 25.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFFDEDEDE), width: 2.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 16,
                            onPressed: decrementCounter,
                            icon: const Icon(Icons.remove),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '$counter',
                        style: const TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFFDEDEDE), width: 2.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 16,
                            onPressed: incrementCounter,
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 9.h, right: 25.w, left: 10),
              child: SizedBox(
                width: 195.w,
                height: 60.h,
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFFC67C4E),
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, route.cartPage);
                    // Get.to(const CartPage());
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const CartPage()),
                    // );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
