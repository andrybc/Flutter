import 'package:flutter/material.dart';
import '../deck.dart';

class SavedSetScreen extends StatelessWidget {
  final Map<String, String> cardTexts = {
    'abacus': 'frame with balls for calculating',
    'harrow': 'to distress create stress or torment',
    'fatuous': 'without sense foolish self-satisfaction',
    'deniz': 'bitch ass nigga'
    // Add as many pairs as you like
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Sets'),
      ),
      body: FlashCardDeck(
        numberOfCards: cardTexts.length,
        cardTexts: cardTexts,
        cardWidth: MediaQuery.of(context).size.width *
            0.5, // Adjust the card width as needed
      ),
    );
  }
}
