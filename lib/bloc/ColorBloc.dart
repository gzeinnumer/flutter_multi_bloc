import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum ColorEvent { red, toAmber, toPurple }

class ColorBLoc extends Bloc<ColorEvent, Color> {
  @override
  Color get initialState => Colors.purple;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    yield (event == ColorEvent.red)
        ? Colors.red
        : (event == ColorEvent.toAmber) ? Colors.amber : Colors.purple;
  }
}
