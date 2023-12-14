import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FlashCard extends StatefulWidget {
  final String frontText;
  final String backText;

  FlashCard({required this.frontText, required this.backText});

  @override
  FlashCardState createState() => FlashCardState();
}

class FlashCardState extends State<FlashCard> {
  bool _isFlipped = false;
  FlutterTts flutterTts = FlutterTts();

  void _flipCard() {
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: buildSide(widget.frontText),
        back: buildSide(widget.backText),
      ),
    );
  }

  Widget buildSide(String text) {
        double textSize = MediaQuery.of(context).size.width * 0.04;  // Adjust the multiplier as needed

    return Card(
      child: Stack(
        children: [
          Center(child: Text(text, style: TextStyle(fontSize: textSize))),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: IconButton(
              icon: Icon(Icons.volume_up),
              onPressed: () {
                flutterTts.speak(text);
              },
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 15,
      shadowColor: Colors.black,
    );
  }
}