// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Part1Complete extends StatelessWidget {
  const Part1Complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Word(input:"Mobile"),
        Word(input:"Flutter"),
        Word(input:"is"),
        Word(input:"Great"),
      ],
    );
  }
}

class Word extends StatelessWidget {
  const Word({Key? key, required this.input}) : super(key: key);

  final String input;

  @override
  Widget build(BuildContext context)
  {
    var letters = <Widget>[];

    for (var character in input.characters)
    {
      print(character);
      letters.add(Letter(letter: character));
    }

    //PS: we could have done the above as a one-liner too
    //well worth learning how map() and other collection functions work
    //map() is useful when we want to create a list of things from an existing list, with a 1-to-1 *mapping*
    //var letters = input.characters.map((character) => Letter(letter:character)).toList();

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: letters
    );
  }
}


class Letter extends StatelessWidget {
  const Letter({Key? key, required this.letter, this.color = Colors.blueGrey}) : super(key: key);

  final String letter;
  final Color color;

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width:64,
        height:64,
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(8.0))
            ),
            child: Center(child: Text(letter.toUpperCase(), style: const TextStyle(fontSize: 36.0),))
        ),
      ),
    );
  }
}
