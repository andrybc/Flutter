import 'package:flutter/material.dart';
import 'deck.dart';
import 'navigation/main_screen.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: 'QuizPilot',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.from(colorScheme: myLightModeColorScheme),
            darkTheme: ThemeData.from(colorScheme: myDarkModeColorScheme),
            themeMode: currentMode,
            home: MainScreen(),
          );
        });
  }
}
