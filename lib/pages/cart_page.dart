import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'edit_location.dart';
import 'office_boy_screens/office_boy_home.dart';
import 'order_accteped.dart';
import 'package:get/get.dart';
import 'package:coffee_ui/route/route.dart' as route;
// import 'order_page.dart';
// import 'package:auto_size_text_field/auto_size_text_field.dart';

enum OfficeBoy { ahmed, mohamed }

enum ButtonSize { S, M, L }

List<DropDownValueModel> dropDownListRoom = [
  const DropDownValueModel(
    value: 'Meeting Room',
    name: 'Meeting Room',
  ),
  const DropDownValueModel(value: 'Operation Room', name: 'Operation Room'),
];
DropDownValueModel? dropdownValueRoom = dropDownListRoom.first;

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int counter = 1;
  final TextEditingController _textEditingController = TextEditingController();
  //bool shouldUpdateTextField = false;
  bool isIconClicked = false;

  // void updateTextField() {
  //   if (shouldUpdateTextField) {
  //     setState(() {
  //       _textEditingController.text = _textEditingController.text;
  //       shouldUpdateTextField = false; // Reset my flag
  //       isIconClicked = true;
  //     });
  //   }
  // }

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

  void showRoundedDialog(BuildContext context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      // isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return const EditLocation();
      },
    );
  }

  ButtonSize selectedSize = ButtonSize.M;
  OfficeBoy selectedOfficeBoy = OfficeBoy.ahmed;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
            // Get.back();
            Navigator.popAndPushNamed(context, route.detailsPage);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF2F2D2C),
          ),
        ),
        title: Text(
          'Cart',
          style: TextStyle(
            fontFamily: 'Sora',
            color: const Color(0xFF2F2D2C),
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 30.r, left: 30.r, top: 25.r),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Office',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Sora'),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Madinaty',
                style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 14.sp,
                    color: const Color(0xFF303336),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Software Team Room, Amr’s Desk',
                style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 12.sp,
                    color: const Color(0xFF9B9B9B),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showRoundedDialog(context);
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const EditLocation()),
                      // );
                    },
                    child: Container(
                      width: 140.w,
                      height: 27.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFDEDEDE), width: 2.0.w),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          const Icon(Icons.edit),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            'Edit Location',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12.sp,
                                color: const Color(0xFF303336)),
                          )
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 8.w,
                  // ),
                  // Container(
                  //   width: 140.w,
                  //   height: 27.h,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //         color: const Color(0xFFDEDEDE), width: 2.0.w),
                  //     borderRadius: BorderRadius.circular(16.r),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //         width: 10.w,
                  //       ),
                  //       const Icon(Icons.event_note_outlined),
                  //       SizedBox(
                  //         width: 4.w,
                  //       ),
                  //       Text(
                  //         'Add Note',
                  //         style: TextStyle(
                  //             fontFamily: 'Sora',
                  //             fontSize: 12.sp,
                  //             color: const Color(0xFF303336)),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 20.h),
              const Divider(
                thickness: 1,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/CartImage.png'),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cappucino',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                      Text(
                        'with Chocolate',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: const Color(0xFF9B9B9B),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 45.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFFDEDEDE), width: 2.0.w),
                          borderRadius: BorderRadius.circular(20.r),
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                        child: Text(
                          '$counter',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        width: 25,
                        height: 25,
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
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.r),
                    child: Text(
                      'Size',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2F2D2C)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 96.w,
                        height: 43.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: selectedSize == ButtonSize.S
                                ? const BorderSide(color: Color(0xFFC67C4E))
                                : const BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedSize = ButtonSize.S;
                            });
                          },
                          child: const Text(
                            'S',
                            style: TextStyle(
                              color: Color(0xFFC67C4E),
                              fontFamily: 'Sora',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 96.w,
                        height: 43.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: selectedSize == ButtonSize.M
                                ? const BorderSide(color: Color(0xFFC67C4E))
                                : const BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedSize = ButtonSize.M;
                            });
                          },
                          child: const Text(
                            'M',
                            style: TextStyle(
                              color: Color(0xFFC67C4E),
                              fontFamily: 'Sora',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 96.w,
                        height: 43.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            //shape: OutlinedBorder,
                            side: selectedSize == ButtonSize.L
                                ? const BorderSide(color: Color(0xFFC67C4E))
                                : const BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedSize = ButtonSize.L;
                            });
                          },
                          child: Text(
                            'L',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                color: const Color(0xFFC67C4E),
                                fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xFFC67C4E), width: 1.0.w),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(Icons.event_note_outlined,
                              color: Colors.grey),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextField(
                              controller: _textEditingController,
                              minLines: 1,
                              maxLines: 3, // Allow multiple lines
                              style: TextStyle(
                                  fontSize: 16.sp, fontFamily: 'Sora'),
                              decoration: InputDecoration(
                                hintText: 'Optional To Add Note',
                                hintStyle: TextStyle(fontSize: 12.sp),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: const EdgeInsets.all(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 3,
                color: Color(0xFFF4F4F4),
              ),
              SizedBox(height: 20.h),
              Column(
                children: [
                  SizedBox(
                    width: 315.w,
                    height: 56.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: selectedOfficeBoy == OfficeBoy.ahmed
                            ? const BorderSide(color: Color(0xFFC67C4E))
                            : const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, route.officePage);
                        // Get.to(const HomeOfficeBoy());
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const HomeOfficeBoy()),
                        // );
                        setState(() {
                          selectedOfficeBoy = OfficeBoy.ahmed;
                        });
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          Image(
                            width: 30.w,
                            height: 30.h,
                            image: const AssetImage(
                                'assets/images/coffee-cup.png'),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            child: Text(
                              'Ahmed Office Boy',
                              style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12.sp,
                                color: const Color(0xFF2F2D2C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          const Icon(
                            size: 18,
                            Icons.arrow_forward_ios,
                            color: Color(0xFF2F2D2C),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 13.h),
                  SizedBox(
                    width: 315.w,
                    height: 56.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: selectedOfficeBoy == OfficeBoy.mohamed
                            ? const BorderSide(color: Color(0xFFC67C4E))
                            : const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedOfficeBoy = OfficeBoy.mohamed;
                        });
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          Image(
                            width: 30.w,
                            height: 30.h,
                            image: const AssetImage(
                                'assets/images/coffee-cup.png'),
                          ),
                          SizedBox(
                            width: 11.w,
                          ),
                          Expanded(
                            child: Text(
                              'Mohamed Office Boy',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 12.sp,
                                  color: const Color(0xFF2F2D2C),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 84.w,
                          ),
                          const Icon(
                            size: 18,
                            Icons.arrow_forward_ios,
                            color: Color(0xFF2F2D2C),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
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
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 315,
              height: 62.h,
              child: FloatingActionButton(
                backgroundColor: const Color(0xFFC67C4E),
                child: const Text(
                  'Order',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, route.orderAcceptedPage);
                  // Get.to(const OrderAccepted());
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const OrderAccepted()),
                  //   //MaterialPageRoute(builder: (context) => const OrderPage()),
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
