import 'package:flutter/material.dart';

const cards= <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation0'},
  {'elevation': 1.0, 'label': 'Elevation1'},
  {'elevation': 2.0, 'label': 'Elevation2'},
  {'elevation': 3.0, 'label': 'Elevation3'},
  {'elevation': 4.0, 'label': 'Elevation4'},
  {'elevation': 5.0, 'label': 'Elevation5'},
];


class CardsScreen extends StatelessWidget {
  static const String name= 'Cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardView()
    );
  }
}

class _CardView extends StatelessWidget {
  const _CardView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) => _CardType1(elevation: card['elevation'], label: card['label']),),
         ...cards.map((card) => _CardType2(elevation: card['elevation'], label: card['label']),),
         
        ],
      ),
    );
  }
}


class _CardType1 extends StatelessWidget {

  final String label;
  final double elevation;
  const _CardType1({super.key, required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {
                  
                },)
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )

          ],
        ),),
    );
  }
}



class _CardType2 extends StatelessWidget {

  final String label;
  final double elevation;
  const _CardType2({super.key, required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {
                  
                },)
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )

          ],
        ),),
    );
  }
}


