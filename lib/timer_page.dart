import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'controller.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(Provider.of<Controller>(context).timer.toString()),
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              Provider.of<Controller>(context).time_decrement();
            },
          )
        ],
      ),
    );
  }
}
