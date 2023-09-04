import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../util/bottom_navigator_bar.dart';
import 'package:coffee_ui/pages/widgets/notification_card.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<NotificationCard> products = [
    const NotificationCard(
      title: 'Your Order is done',
      icon: Icons.check_box,
    ),
    const NotificationCard(
      title: 'Your Order is being prepared',
      icon: Icons.loop,
    ),
    const NotificationCard(
      title: 'Your Order is pending',
      icon: Icons.access_time_outlined,
    ),
    const NotificationCard(
      title: 'Your Order is done',
      icon: Icons.check_box,
    ),

    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return Scaffold(
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Notifications',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true, // Important for using ListView inside a Column
              physics:
                  const NeverScrollableScrollPhysics(), // Disable ListView's scrolling
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return products[
                    index]; // Assuming ProductCard is a widget that you've defined
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const IconNavigation(),
    );
  }
}
