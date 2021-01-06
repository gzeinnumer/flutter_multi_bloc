import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_bloc/bloc/ColorBloc.dart';
import 'package:flutter_multi_bloc/bloc/CounterBLoc.dart';
import 'package:flutter_multi_bloc/ui/MainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBLoc>(
          builder: (context) => ColorBLoc(),
        ),
        BlocProvider<CounterBloc>(
          builder: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
