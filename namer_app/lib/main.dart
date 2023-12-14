import 'package:flutter/material.dart';
import 'deck.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Card App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 38, 6, 97)),
      ),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatelessWidget {
  final Map<String, String> cardTexts = {
    'abacus': 'frame with balls for calculating',
    'harrow': 'to distress create stress or torment',
    'fatuous': 'without sense foolish self-satisfaction',
    'deniz' : 'bitch ass nigga'
    // Add as many pairs as you like
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlashCardDeck(
        numberOfCards: cardTexts.length,
        cardTexts: cardTexts,
        cardWidth: MediaQuery.of(context).size.width *0.9,  // Adjust the card width as needed
      ),
    );
  }
}
