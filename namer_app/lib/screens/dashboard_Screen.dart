import 'package:flutter/material.dart';



class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.add), text: "Manual",),
                Tab(icon: Icon(Icons.generating_tokens), text: "AI Gen"),
                Tab(icon: Icon(Icons.camera), text: "Import"),
              ],
            ),

          ),
          body: const TabBarView(
            children: [
              Icon(Icons.add),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
