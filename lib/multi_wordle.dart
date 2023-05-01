// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_week_10/full_wordle.dart';

class MultiWordle extends StatelessWidget {
  const MultiWordle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    //here is how declarative programming style can be powerful:
    //return GridView.count(crossAxisCount: 2, children:const [
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,//just flutter things
        children: const [
          Word(correctWord:"RICK"),
          Word(correctWord:"MORTY"),
          Word(correctWord:"SUMMER"),
          Word(correctWord:"JERRY"),
        ]
      ),
    );

  }
}

