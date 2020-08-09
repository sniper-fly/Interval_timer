import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';

class Controller extends ChangeNotifier {
  List<String> notes = [];
  int currentTimer;

  void increment(String arg) {
    notes.add(arg);
    notifyListeners();
  }

//  void timeDecrement() async {
//    while (timer > 0) {
//      await Future.delayed(Duration(seconds: 1));
//      timer--;
//      notifyListeners();
//    }
//  }

  Future<void> timer(int time) async {
    currentTimer = time;
    notifyListeners();
    while (currentTimer > 0) {
      await Future.delayed(Duration(milliseconds: 100));
      currentTimer--;
      notifyListeners();
    }
  }

  //3
  //while (i < n) {
  //30
  //5
  //20
  //5
  //}
  //10


//  List<int> intervals = [warmUpTime, 30, 5, coolDownTime];
  int setNumber = 3;
  int warmUpTime = 3;
  int coolDownTime = 15;
  List<int> mainIntervals = [10, 5];

  List<int> createIntervalList(int warmUpTime, List<int> mainIntervals, int coolDownTime) {
    List<int> intervals = [];
    intervals.add(warmUpTime);
    for (int n in mainIntervals) {
      intervals.add(n);
    }
    intervals.add(coolDownTime);
    return (intervals);
  }

  void startTimer() async {
    List<int> intervals = createIntervalList(warmUpTime, mainIntervals, coolDownTime);

    await timer(intervals[0]);
    for (int i = 0; i < setNumber; i++) {
      for (int j = 1; j < intervals.length - 2; j++) {
        await timer(intervals[j]);
      }
    }
    await timer(intervals[intervals.length - 1]);
  }
}
