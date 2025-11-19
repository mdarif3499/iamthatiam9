import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/const/auth_constants.dart';
import '../../../core/const/token_key.dart';
import '../../../core/services/storage_services/storage_service.dart';
import '../controller/nav_bar_controller.dart';



class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final NavBarController controller = Get.put(NavBarController());
  int _currentPage = 0;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // REMOVE bottomNavigationBar ENTIRELY

      body: Stack( // Use a Stack to layer the screen and the navigation bar
        children: [
          // 1. The current screen (UltraFancyUiPage) now takes full screen space
          Obx(() => controller.screens[controller.currentIndex]),

          // 2. Overlay the Navigation Bar at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: DotCurvedBottomNav(
              // ... all the existing properties ...
              scrollController: _scrollController,
              hideOnScroll: true,
              indicatorColor: Colors.purple,
              backgroundColor: Colors.blue,
              animationDuration: const Duration(milliseconds: 100),
              animationCurve: Curves.bounceInOut,
              selectedIndex: _currentPage,
              indicatorSize: 5,
              borderRadius: 30,
              height: 70,
              onTap: (index) {
                setState(() {
                  _currentPage = index;
                  controller.changeIndex(index);
                });
              },
              items: [
                Icon(Icons.home, color: _currentPage == 0 ? Colors.blue : Colors.white),
                Icon(Icons.notification_add, color: _currentPage == 1 ? Colors.blue : Colors.white),
                Icon(Icons.color_lens, color: _currentPage == 2 ? Colors.blue : Colors.white),
                Icon(Icons.person, color: _currentPage == 3 ? Colors.blue : Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(TokenKey.accessToken);

    if (token != null) {
      StorageService().saveData(AuthConstants.accessToken, token);
    }
  }
}



