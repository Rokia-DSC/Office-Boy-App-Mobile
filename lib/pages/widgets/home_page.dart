import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee_ui/AppConstant/assests_manager.dart';
import 'package:coffee_ui/pages/widgets/product_card.dart';
//import '../../util/bottom_navigator_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductCard> cappuccinoProducts = [
    ProductCard(
      title: 'Cappucino',
      subtitle: 'with Oat Milk',
      img: AssetsManager().prod3,
    ),
    ProductCard(
        title: 'Cappucino',
        subtitle: 'with Chocolate',
        img: AssetsManager().prod1),
    ProductCard(
        title: 'Cappucino',
        subtitle: 'with Chocolate',
        img: AssetsManager().prod1),
    ProductCard(
        title: 'Cappucino',
        subtitle: 'with Chocolate',
        img: AssetsManager().prod1),
  ];
  List<ProductCard> machiatoProducts = [
    ProductCard(
      title: 'Cappucino',
      subtitle: 'with Oat Milk',
      img: AssetsManager().prod2,
    ),
    ProductCard(
        title: 'Cappucino',
        subtitle: 'with Chocolate',
        img: AssetsManager().prod1),
    ProductCard(
        title: 'Cappucino',
        subtitle: 'with Chocolate',
        img: AssetsManager().prod1),
    ProductCard(
        title: 'Cappucino',
        subtitle: 'with Chocolate',
        img: AssetsManager().prod1),
    ProductCard(
      title: 'Cappucino',
      subtitle: 'with Oat Milk',
      img: AssetsManager().prod3,
    ),
  ];
  List<ProductCard> latteProducts = [
    ProductCard(
      title: 'Cappucino',
      subtitle: 'with Oat Milk',
      img: AssetsManager().prod3,
    ),
  ];
  List<ProductCard> americanoProducts = [
    ProductCard(
        title: 'Cappucino',
        subtitle: 'with Chocolate',
        img: AssetsManager().prod1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: 375.w,
              height: 280.h,
              decoration: const BoxDecoration(
                color: Colors.black87,
              ),
            ),
          ),
          Positioned(
            top: 15.h,
            child: Padding(
              padding: EdgeInsets.only(left: 30.r, top: 62.r),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Cairo, Egypt',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 154.w,
                  ),
                  SizedBox(
                      width: 44.w,
                      height: 44.h,
                      child: ClipRRect(
                        // Use ClipRRect to clip the image to the container's border radius
                        borderRadius: BorderRadius.circular(14.r),
                        child: Image.asset(
                          AssetsManager().tmg,
                          fit: BoxFit
                              .cover, // Use BoxFit.cover instead of BoxFit.fill
                        ),
                      )
                      //

                      ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 128.h, // Adjust the position based on your layout needs
            left: 30.r,
            right: 30.r,
            child: Container(
              width: 315.w,
              height: 52.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: const Color(0xFF313131)),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: "Search coffee",
                  labelStyle: const TextStyle(
                    color: Color(0xFF989898),
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 4.r),
                    child: Container(
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffC67C4E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.tune,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
            ),
          ),
          Positioned(
            left: 30.w,
            right: 30.w,
            top: 204.h,
            child: Column(
              children: [
                Container(
                  width: 315.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: ClipRRect(
                    // Use ClipRRect to clip the image to the container's border radius
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      AssetsManager().frame,
                      fit: BoxFit
                          .cover, // Use BoxFit.cover instead of BoxFit.fill
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [
                          Material(
                            child: Container(
                              height: 55,
                              color: Colors.white,
                              child: TabBar(
                                  isScrollable: true,
                                  unselectedLabelColor: Colors.black,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  labelStyle: TextStyle(fontSize: 14.w),
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: const Color(0xFFC67C4E),
                                  ),
                                  tabs: const [
                                    Tab(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("Cappuccino"),
                                      ),
                                    ),
                                    Tab(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("Machiato"),
                                      ),
                                    ),
                                    Tab(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("Latte"),
                                      ),
                                    ),
                                    Tab(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("Americano"),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: 400.h,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const BouncingScrollPhysics(), // Disable GridView's scrolling within SingleChildScrollView
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 220,
                                    crossAxisCount:
                                        2, // Number of items per row
                                    crossAxisSpacing: 16.0, //space bet them
                                    mainAxisSpacing: 16.0,
                                  ),
                                  itemCount: cappuccinoProducts.length,
                                  itemBuilder: (context, index) {
                                    return cappuccinoProducts[index];
                                  },
                                ),
                                GridView.builder(
                                  shrinkWrap:
                                      true, // Important to wrap inside a SingleChildScrollView
                                  physics:
                                      const ClampingScrollPhysics(), // Disable GridView's scrolling within SingleChildScrollView
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 220,
                                    crossAxisCount:
                                        2, // Number of items per row
                                    crossAxisSpacing: 16.0, //space bet them
                                    mainAxisSpacing: 16.0,
                                  ),
                                  itemCount: machiatoProducts.length,
                                  itemBuilder: (context, index) {
                                    return machiatoProducts[index];
                                  },
                                ),
                                GridView.builder(
                                  shrinkWrap:
                                      true, // Important to wrap inside a SingleChildScrollView
                                  physics:
                                      const BouncingScrollPhysics(), // Disable GridView's scrolling within SingleChildScrollView
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 220,
                                    crossAxisCount:
                                        2, // Number of items per row
                                    crossAxisSpacing: 16.0, //space bet them
                                    mainAxisSpacing: 16.0,
                                  ),
                                  itemCount: latteProducts.length,
                                  itemBuilder: (context, index) {
                                    return latteProducts[index];
                                  },
                                ),
                                GridView.builder(
                                  shrinkWrap:
                                      true, // Important to wrap inside a SingleChildScrollView
                                  physics:
                                      const BouncingScrollPhysics(), // Disable GridView's scrolling within SingleChildScrollView
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 220,
                                    crossAxisCount:
                                        2, // Number of items per row
                                    crossAxisSpacing: 16.0, //space bet them
                                    mainAxisSpacing: 16.0,
                                  ),
                                  itemCount: americanoProducts.length,
                                  itemBuilder: (context, index) {
                                    return americanoProducts[index];
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
      //bottomNavigationBar: const IconNavigation(),
    );
  }
}
