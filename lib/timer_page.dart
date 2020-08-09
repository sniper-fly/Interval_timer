import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class TimerPage extends StatelessWidget {
  final context;
  TimerPage(this.context);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Provider.of<Controller>(context).currentTimer.toString(),
            style: TextStyle(fontSize: 20.0),
          ),
          IconButton(
            icon: Provider.of<Controller>(context).state ==
                    TimerState.outOfProcess
                ? Icon(Icons.play_arrow)
                : Icon(Icons.stop),
            onPressed: () {
              if (Provider.of<Controller>(context, listen: false).state ==
                  TimerState.outOfProcess) {
                Provider.of<Controller>(context, listen: false).startTimer();
              } else {
                Provider.of<Controller>(context, listen: false).stopTimer();
              }
            },
          )
        ],
      ),
    );
  }
}
