import 'package:flutter/material.dart';
import '../main.dart';
import '../screens/dashboard_Screen.dart';
import '../screens/home_Screen.dart';
import '../screens/settings_Screen.dart';
import '../screens/profile_Screen.dart';
import 'navigationbar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    DashboardScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _toggleNightMode() {
    MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'FLASHNAV.',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'AI',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                ? Icons.nightlight_round
                : Icons.wb_sunny),
            onPressed: _toggleNightMode,
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 3,
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 600
          ? BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              currentIndex: _currentIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Theme.of(context).colorScheme.secondary,
              // called when one tab is selected
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              // bottom tab items
              items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_box), label: 'Create'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.rectangle_rounded), label: 'Sets'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.notifications,
                      ),
                      label: 'Notifications')
                ])
          : null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 600)
            NavigationRail(
              onDestinationSelected: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },

              selectedIndex: _currentIndex,
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home, color: Colors.grey),
                    label: Text('Home')),
                NavigationRailDestination(
                    icon: Icon(Icons.feed, color: Colors.grey),
                    label: Text('Feed')),
                NavigationRailDestination(
                    icon: Icon(Icons.favorite, color: Colors.grey),
                    label: Text('Favorites')),
                NavigationRailDestination(
                    icon: Icon(Icons.settings, color: Colors.grey),
                    label: Text('Settings')),
              ],

              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              selectedIconTheme: IconThemeData(
                color: Theme.of(context).colorScheme.secondary,
              ),
              // unselectedIconTheme: IconThemeData(color: Colors.grey),
              unselectedLabelTextStyle: TextStyle(color: Colors.grey),
              // Called when one tab is selected
              leading: Column(
                children: const [
                  SizedBox(
                    height: 18,
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ),
          Expanded(child: _screens[_currentIndex])
        ],
      ),
    );
  }
}
