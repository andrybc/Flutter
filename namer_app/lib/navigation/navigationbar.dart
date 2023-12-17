import 'package:flutter/material.dart';

class NavigationBarQP extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;
  final ColorScheme colorScheme;
  final bool isNightMode;

  NavigationBarQP({
    required this.currentIndex,
    required this.onTabSelected,
    required this.colorScheme,
    required this.isNightMode,
  });
  final List<BottomNavigationBarItem> items = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
    BottomNavigationBarItem(
        icon: Icon(Icons.rectangle_outlined), label: 'Sets'),
  ];

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: onTabSelected,
        selectedItemColor:
            isNightMode ? Colors.white : Color.fromARGB(255, 38, 6, 97),
        unselectedItemColor:
            isNightMode ? Color.fromARGB(255, 38, 6, 97) : Colors.black,
        // backgroundColor: isNightMode ? Color.fromARGB(255, 38, 6, 97) : Colors.white,
      );
    } else {
      return Row(
        children: <Widget>[
          NavigationRail(
            destinations: items
                .map((item) => NavigationRailDestination(
                      icon: item.icon,
                      label: Text("Money",
                          style: TextStyle(
                              color: isNightMode
                                  ? Colors.white
                                  : colorScheme.onBackground)),
                    ))
                .toList(),
            selectedIndex: currentIndex,
            onDestinationSelected: onTabSelected,
            backgroundColor:
                isNightMode ? Color.fromARGB(255, 38, 6, 97) : Colors.white,
          ),
          const VerticalDivider(thickness: 1, width: 1),
        ],
      );
    }
  }
  // }
}
