import 'package:flutter/material.dart';
import '../pages/cart_page.dart';
import '../pages/widgets/home_page.dart';
import '../pages/widgets/favorites.dart';
import '../pages/widgets/notifications.dart';

class IconNavigation extends StatefulWidget {
  const IconNavigation({super.key});

  @override
  _IconNavigationState createState() => _IconNavigationState();
}

class _IconNavigationState extends State<IconNavigation> {
  int selectedIndex = 0;

  List<Color> iconColors = [
    const Color(0xFF8D8D8D),
    const Color(0xFF8D8D8D),
    const Color(0xFF8D8D8D),
    const Color(0xFF8D8D8D),
  ];

  List<Widget> pages = [
    const HomePage(),
    Favorites(),
    const CartPage(),
    const Notifications(),
  ];

  void selectIcon(int index) {
    if (selectedIndex != index) {
      setState(() {
        selectedIndex = index;
        iconColors = List<Color>.generate(4, (i) {
          return i == index ? const Color(0xFFC67C4E) : Colors.black;
        });
      });

      // Navigate to the specific page if not already on it
      if (ModalRoute.of(context)?.settings.name != pages[index].toString()) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => pages[index]),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 376,
      height: 80,
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
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => selectIcon(0),
            icon: Icon(Icons.home, color: iconColors[0]),
          ),
          IconButton(
            onPressed: () => selectIcon(1),
            icon: Icon(Icons.favorite, color: iconColors[1]),
          ),
          IconButton(
            onPressed: () => selectIcon(2),
            icon: Icon(Icons.shopping_bag, color: iconColors[2]),
          ),
          IconButton(
            onPressed: () => selectIcon(3),
            icon: Icon(Icons.notifications, color: iconColors[3]),
          ),
        ],
      ),
    );
  }
}
