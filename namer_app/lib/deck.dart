import 'package:flutter/material.dart';
import 'flash_card.dart';



class FlashCardDeck extends StatelessWidget {
  final int numberOfCards;
  final Map<String, String> cardTexts;
  final double cardWidth;

  FlashCardDeck({required this.numberOfCards, required this.cardTexts, required this.cardWidth});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth < cardWidth ? constraints.maxWidth : cardWidth;
        double height = width / 1.5;

        return PageView.builder(
          itemCount: numberOfCards,
          itemBuilder: (context, index) {
            String frontText = cardTexts.keys.elementAt(index);
            String backText = cardTexts[frontText]!;

            return Center(
              child: Container(
                width: width,
                height: height,
                child: FlashCard(
                  frontText: frontText,
                  backText: backText,
                ),
              ),
            );
          },
        );
      },
    );
  }
}