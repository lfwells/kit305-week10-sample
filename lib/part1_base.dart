// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Part1Base extends StatelessWidget {
  const Part1Base({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Word();
  }
}

class Word extends StatelessWidget {
  const Word({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    var input = "Mobile"; //TODO: make this a parameter

    var letters = <Widget>[];

    for (var character in input.characters)
    {
      print(character);
      letters.add(const Letter());
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: letters
    );
  }
}


class Letter extends StatelessWidget {
  const Letter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    //TODO: make these parameters
    var letter = "?";
    var color = Colors.blueGrey;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width:48,
        height:48,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8.0))
          ),
          child: Center(child: Text(letter.toUpperCase(), style: const TextStyle(fontSize: 24.0),))
        ),
      ),
    );
  }
}
