import 'package:ev_charging_point_app/features/presentation/providers/station_provider.dart';
import 'package:ev_charging_point_app/features/presentation/screens/add_station.dart';
import 'package:ev_charging_point_app/features/presentation/screens/home_screen.dart';
import 'package:ev_charging_point_app/features/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import '../widgets/size_config.dart';

class MainScreen extends ConsumerWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  MainScreen({super.key});

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const Text('2'),
    AddStation(),
    const Text('4'),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    ref.read(stationListNotifierProvider.notifier).loadStations();

    return SafeArea(
      child: Scaffold(
        body: _widgetOptions[indexBottomNavbar],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: indexBottomNavbar,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.shade700,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map_rounded,
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.payment,
                ),
                label: "Payments"),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.qr_code_scanner,
                  ),
                ),
                label: "Scan"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                label: "Notification"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile"),
          ],
          onTap: (value) {
            ref.read(indexBottomNavbarProvider.notifier).update((state) => value);
          },
        ),
      ),
    );
  }
}
