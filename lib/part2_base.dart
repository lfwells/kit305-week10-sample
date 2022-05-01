// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Part2Base extends StatelessWidget {
  const Part2Base({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Word(correctWord:"Smirk");
  }
}

class Word extends StatelessWidget {
  const Word({Key? key, required this.correctWord}) : super(key: key);

  final String correctWord;

  @override
  Widget build(BuildContext context)
  {
    var letters = <Widget>[];

    //TODO: make this a state variable
    var input = "Smack";

    for (var i = 0; i < input.length; i++)
    {
      var character = input.substring(i, i+1);
      print(character);

      //added: Wordle logic
      if (i < correctWord.length && correctWord.substring(i, i+1) == character)
      {
        letters.add(Letter(letter: character, color: Colors.green));
      }
      else if (correctWord.contains(character))
      {
        letters.add(Letter(letter: character, color: Colors.yellow));
      }
      else
      {
        letters.add(Letter(letter: character, color: Colors.blueGrey));
      }
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: letters
        ),

        //TODO: make this text-box stateful
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: const TextStyle(fontSize: 36),
              decoration: const InputDecoration(
                  labelText: "Input Guess"
              ),
              initialValue: input,
            )
        ),

      ],
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
