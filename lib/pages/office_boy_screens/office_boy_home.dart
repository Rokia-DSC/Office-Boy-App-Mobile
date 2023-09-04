import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../util/upcoming_orders.dart';

class HomeOfficeBoy extends StatefulWidget {
  const HomeOfficeBoy({Key? key}) : super(key: key);

  @override
  _HomeOfficeBoyState createState() => _HomeOfficeBoyState();
}

class _HomeOfficeBoyState extends State<HomeOfficeBoy> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 2,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFFC67C4E),
              ),
            ),
            title: const Text(
              'Mohammed Badr',
              style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.black,
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.person,
                  color: Color(0xFFC67C4E),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              TabBar(
                indicatorColor: const Color(0xFFC67C4E),
                labelColor: const Color(0xFFC67C4E),
                unselectedLabelColor: Colors.black,
                padding: EdgeInsets.only(top: 10.h),
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Sora',
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Finished',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Sora',
                      ),
                    ),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Upcoming Tab
                    SingleChildScrollView(
                      padding: EdgeInsets.all(20.h),
                      child: const Column(
                        children: [
                          UpComingOrders(
                            quantity: '1',
                            order: 'Cappuccino',
                            roomNo: '2',
                            officeNo: '3',
                            employeeName: 'Eng Menam Mohamed',
                          ),
                          UpComingOrders(
                            quantity: '2',
                            order: 'Latte',
                            roomNo: '3',
                            officeNo: '4',
                            employeeName: 'Eng Mark Ragaee',
                          ),
                          UpComingOrders(
                            quantity: '3',
                            order: 'Coffee',
                            roomNo: '3',
                            officeNo: '1',
                            employeeName: 'Eng Ahmed Samir',
                          ),
                        ],
                      ),
                    ),
                    // Finished Tab
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Finished Tab',
                        style: TextStyle(
                          fontFamily: 'Sora',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTab,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                label: 'Notifications',
              ),
            ],
            selectedItemColor: const Color(0xFFC67C4E),
            unselectedItemColor: Colors.black,
            onTap: (index) {
              setState(() {
                _selectedTab = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
