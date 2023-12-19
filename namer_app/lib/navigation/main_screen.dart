import 'package:flutter/material.dart';
import '../main.dart';
import '../screens/dashboard_Screen.dart';
import '../screens/home_Screen.dart';
import '../screens/settings_Screen.dart';
import '../screens/profile_Screen.dart';
import 'navigationbar.dart';
import '../screens/savedSets_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    DashboardScreen(),
    SavedSetScreen(),
    PlaceholderScreen('Notifications'),
    PlaceholderScreen('Test'),
    PlaceholderScreen('Interleaved'),
    PlaceholderScreen('SM2'),
    PlaceholderScreen('Quiz'),
    PlaceholderScreen('Pomodoro'),
    PlaceholderScreen('Stats'),
    ProfileScreen(),
    SettingsScreen(),
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
          _buildProfileMenu(), // Profile picture icon with dropdown menu
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
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_box), label: 'Create'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.rectangle_rounded), label: 'Sets'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications,
                    ),
                    label: 'Notifications')
              ],
            )
          : null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 600)
            Drawer(
              child: ListView(
                children: [
                  _buildListTile('Home', Icons.home, () {
                    _onTabSelected(0);
                  }),
                  _buildListTile('Saved Sets', Icons.rectangle_outlined, () {
                    _onTabSelected(2);
                  }),
                  _buildExpansionTile(
                    title: 'Create',
                    icon: Icons.add,
                    onTap: () {
                      _onTabSelected(1);
                    },
                    children: [
                      _buildListTile('Manual', Icons.edit, () {
                        _onTabSelected(1);
                      }),
                      _buildListTile('AIGen', Icons.airplanemode_active_rounded,
                          () {
                        _onTabSelected(1);
                      }),
                      _buildListTile('Import', Icons.camera, () {
                        _onTabSelected(1);
                      }),
                    ],
                  ),
                  _buildExpansionTile(
                    title: 'Test',
                    icon: Icons.quiz,
                    onTap: () {
                      _onTabSelected(4);
                    },
                    children: [
                      _buildListTile('Pomodoro', Icons.lock_clock, () {
                        _onTabSelected(8);
                      }),
                      _buildListTile('Quiz', Icons.grade, () {
                        _onTabSelected(7);
                      }),
                      _buildListTile('Interleaved', Icons.group, () {
                        _onTabSelected(5);
                      }),
                      _buildListTile('SM2', Icons.smart_button, () {
                        _onTabSelected(6);
                      }),
                    ],
                  ),
                  _buildListTile('Stats', Icons.graphic_eq, () {
                    _onTabSelected(9);
                  }),
                  _buildListTile('Notifications', Icons.notifications, () {
                    _onTabSelected(3);
                  }),
                  _buildListTile('Settings', Icons.settings, () {
                    _onTabSelected(11);
                  }),
                ],
              ),
            ),
          Expanded(child: _screens[_currentIndex]),
        ],
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required IconData icon,
    VoidCallback? onTap,
    List<Widget>? children,
  }) {
    return ExpansionTile(
      title: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap,
      ),
      children: children ?? [],
    );
  }

  Widget _buildListTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildProfileMenu() {
    return PopupMenuButton(
      itemBuilder: (context) => MediaQuery.of(context).size.width < 600
          ? _getMobileMenuItems()
          : _getDesktopMenuItems(),
      icon: CircleAvatar(
        radius: 15,
        backgroundImage: AssetImage(
            '../../assets/profile.png'), // Add user's profile image here
      ),
    );
  }

  List<PopupMenuItem> _getDesktopMenuItems() {
    return [
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.help),
          title: Text('Help'),
          onTap: () {
            // Handle Help
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.contact_mail),
          title: Text('Contact Us'),
          onTap: () {
            // Handle Contact Us
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile'),
          onTap: () {
            // Handle Profile
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.gavel),
          title: Text('Legal Terms'),
          onTap: () {
            // Handle Legal Terms
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.privacy_tip),
          title: Text('Privacy Policy'),
          onTap: () {
            // Handle Privacy Policy
          },
        ),
      ),
    ];
  }

  List<PopupMenuItem> _getMobileMenuItems() {
    return [
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile'),
          onTap: () {
            // Handle Profile
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.help),
          title: Text('Help'),
          onTap: () {
            // Handle Help
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.contact_mail),
          title: Text('Contact Us'),
          onTap: () {
            // Handle Contact Us
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.gavel),
          title: Text('Legal Terms'),
          onTap: () {
            // Handle Legal Terms
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.privacy_tip),
          title: Text('Privacy Policy'),
          onTap: () {
            // Handle Privacy Policy
          },
        ),
      ),
    ];
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String screenName;

  PlaceholderScreen(this.screenName);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Placeholder Screen: $screenName',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
