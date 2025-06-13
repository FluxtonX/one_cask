import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_cask/pallete.dart';
import 'package:one_cask/presentation/screens/my_collection_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 1;

  final PageController _controller = PageController(initialPage: 1);

  final List<Widget> _screens = const [
    ScanScreen(),
    MyCollectionScreen(),
    ShopScreen(),
    SettingsScreen(),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
        },
        selectedItemColor: const Color(0xFFD4AF37),
        unselectedItemColor: Colors.white70,
        backgroundColor: Pallete.backgroundColor,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_scanner,
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.cube_box,
            ),
            label: 'Collection',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.cart,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.settings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Scan')),
    );
  }
}

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Shop')),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Settings')),
    );
  }
}
