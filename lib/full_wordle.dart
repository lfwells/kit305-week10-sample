// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class FullWordle extends StatelessWidget {
  const FullWordle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: Word(correctWord:"SMIRK")); //TODO: make this input too
  }
}

class Word extends StatefulWidget {
  const Word({Key? key, required this.correctWord}) : super(key: key);

  final String correctWord;

  @override
  State<Word> createState() => _WordState();
}

class _WordState extends State<Word>
{
  //keep a list of guesses for this game
  late List<String> guesses;

  //here is the text editing controller that is the more correct way of handling text input
  final inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    guesses = [];
  }

  @override
  Widget build(BuildContext context)
  {
    var guessedWords = <Widget>[];

    for (var guess in guesses)
    {
      var letters = <Widget>[];

      for (var i = 0; i < guess.length; i++)
      {
        var character = guess.substring(i, i + 1);
        if (i < widget.correctWord.length &&
            widget.correctWord.substring(i, i + 1) == character) {
          letters.add(Letter(letter: character, color: Colors.green));
        }
        else if (widget.correctWord.contains(character)) {
          letters.add(Letter(letter: character, color: Colors.yellow));
        }
        else {
          letters.add(Letter(letter: character, color: Colors.blueGrey));
        }
      }

      guessedWords.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: letters
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Wordle Game!", style:TextStyle(fontSize: 24)),
        ),

        ...guessedWords, //magic spread operator syntax here :)

        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(fontSize: 36),
                    decoration: const InputDecoration(
                        labelText: "Input Guess"
                    ),
                    controller: inputController, //here is the text editing controller that is the more correct way of handling text input

                    //in this version, we modify the state (guess list) when text entered
                    onEditingComplete: () {
                      setState(() {
                        guesses.add(inputController.text.toUpperCase());
                        inputController.clear();
                      });
                    },
                  ),
                ),
                ElevatedButton.icon(onPressed: () {
                  setState(() {
                    guesses.clear();
                    inputController.clear();
                  });
                } , icon: const Icon(Icons.restart_alt), label: const Text("RESET"))
              ],
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
