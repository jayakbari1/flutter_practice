import 'package:flutter/material.dart';

import 'home_card_widget.dart';

class HomePortraitWidget extends StatelessWidget {
  const HomePortraitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              Expanded(
                child: HomeCardWidget(cardText: 'Card 1'),
              ),
              Expanded(
                child: HomeCardWidget(cardText: 'Card 2'),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              Expanded(
                child: Card(
                  child: HomeCardWidget(cardText: 'Card 3'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Expanded(
                child: HomeCardWidget(cardText: 'Card 4'),
              ),
              const Expanded(
                child: HomeCardWidget(cardText: 'Card 5'),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const ImageIcon(
                    NetworkImage(
                        scale: 10,
                        'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
