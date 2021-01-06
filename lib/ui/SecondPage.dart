import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_bloc/bloc/ColorBloc.dart';
import 'package:flutter_multi_bloc/bloc/CounterBLoc.dart';
import 'package:flutter_multi_bloc/ui/DrafPage.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBLoc, Color>(
      builder: (context, cColor) =>
          DraftPage(
            bgC: cColor,
            content: content(context, cColor),
          ),
    );
  }

  Center content(BuildContext context, Color cColor) {
    ColorBLoc colorBLoc = BlocProvider.of<ColorBLoc>(context);
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, int>(
            builder: (context, count) =>
                GestureDetector(
                  onTap: () {
                    counterBloc.dispatch(count + 1);
                  },
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  colorBLoc.dispatch(ColorEvent.toPurple);
                },
                color: Colors.purple,
                shape: (cColor == Colors.purple)
                    ? CircleBorder(side: borderBlack())
                    : CircleBorder(),
              ),
              RaisedButton(
                onPressed: () {
                  colorBLoc.dispatch(ColorEvent.toAmber);
                },
                color: Colors.amber,
                shape: (cColor == Colors.amber)
                    ? CircleBorder(side: borderBlack())
                    : CircleBorder(),
              ),
              RaisedButton(
                onPressed: () {
                  colorBLoc.dispatch(ColorEvent.red);
                },
                color: Colors.red,
                shape: (cColor == Colors.red)
                    ? CircleBorder(side: borderBlack())
                    : CircleBorder(),
              ),
            ],
          )
        ],
      ),
    );
  }

  BorderSide borderBlack() {
    return BorderSide(
      color: Colors.black,
      width: 3,
    );
  }
}
