import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee_ui/AppConstant/assests_manager.dart';
import 'package:coffee_ui/pages/widgets/product_card.dart';

//import '../../util/bottom_navigator_bar.dart';

class Favorites extends StatelessWidget {
  Favorites({super.key});

  final List<ProductCard> products = [
    ProductCard(
        title: 'Cappucino',
        subtitle: 'with Chocolate',
        img: AssetsManager().prod1),
    ProductCard(
      title: 'Cappucino',
      subtitle: 'with Oat Milk',
      img: AssetsManager().prod2,
    ),
    ProductCard(
      title: 'Cappucino',
      subtitle: 'with Oat Milk',
      img: AssetsManager().prod3,
    ),
    ProductCard(
      title: 'Cappucino',
      subtitle: 'with Oat Milk',
      img: AssetsManager().prod1,
    ),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Scaffold(
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60.h), // Add space at the top
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Favorites',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
          ),

          GridView.builder(
            shrinkWrap:
                true, // Important to wrap inside a SingleChildScrollView
            physics:
                const NeverScrollableScrollPhysics(), // Disable GridView's scrolling within SingleChildScrollView
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 220,
              crossAxisCount: 2, // Number of items per row
              crossAxisSpacing: 16.0, //space bet them
              mainAxisSpacing: 16.0,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return products[
                  index]; // Assuming ProductCard is a widget that you've defined
            },
          ),
        ],
      ),
      // bottomNavigationBar: const IconNavigation(),
    );
  }
}
