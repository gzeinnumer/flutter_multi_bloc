import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_bloc/bloc/ColorBloc.dart';
import 'package:flutter_multi_bloc/bloc/CounterBLoc.dart';
import 'package:flutter_multi_bloc/ui/DrafPage.dart';
import 'package:flutter_multi_bloc/ui/SecondPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBLoc, Color>(
      builder: (context, cColor) => DraftPage(
        content: content(context, cColor),
        bgC: cColor,
      ),
    );
  }

  Center content(BuildContext context, Color cColor) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, int>(
            builder: (context, count) =>  Text(
              count.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          RaisedButton(
            child: Text("Ganti Setingan"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ));
            },
            color: cColor,
            shape: StadiumBorder(),
          )
        ],
      ),
    );
  }
}
