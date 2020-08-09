import 'dart:async';

import 'package:flutter/cupertino.dart';

enum TimerState {
  outOfProcess,
  inWarmingUp,
  inMainInterval,
  inCoolingDown,
  stopped,
}

class Controller extends ChangeNotifier {
  int currentTimer;
  int setNumber = 3;
  int currentSetNumber;
  int warmUpTime = 1;
  int coolDownTime = 1;
  List<int> mainIntervals = [3, 4];
  TimerState state = TimerState.outOfProcess;
  bool shouldStop = false;

  void onPressed() {
    switch (state){
      case TimerState.outOfProcess:
        startTimer();
        break;
      case TimerState.inWarmingUp:
        restartWarmUp(currentTimer);
        break;
      case TimerState.inMainInterval:
        restartMainInterval(currentTimer)
        break;
      case TimerState.inCoolingDown:
        // TODO: Handle this case.
        break;
      case TimerState.stopped:
        // TODO: Handle this case.
        break;
    }
  }

  Future<void> timer(int time, TimerState newState) async {
    state = newState;
    currentTimer = time;
    notifyListeners();
    while (currentTimer > 0 && !shouldStop) {
      await Future.delayed(Duration(seconds: 1));
      currentTimer--;
      notifyListeners();
    }
  }

  void startTimer() async {
    await timer(warmUpTime, TimerState.inWarmingUp);
    for (int i = 0; i < setNumber; i++) {
      currentSetNumber = i;
      for (var item in mainIntervals) {
        await timer(item, TimerState.inMainInterval);
      }
    }
    await timer(coolDownTime, TimerState.inCoolingDown);
    state = TimerState.outOfProcess;
    notifyListeners();
  }

  void stopTimer() async {
    shouldStop = true;

  }

  void restartWarmUp(int time) async {
    await timer(time, TimerState.inWarmingUp);
    for (int i = 0; i < setNumber; i++) {
      currentSetNumber = i;
      for (var item in mainIntervals) {
        await timer(item, TimerState.inMainInterval);
      }
    }
    await timer(coolDownTime, TimerState.inCoolingDown);
    state = TimerState.outOfProcess;
    notifyListeners();
  }

  void restartMainInterval(int time) async {
    for (int i = currentSetNumber; i < setNumber; i++) {
      currentSetNumber = i;
      for (var item in mainIntervals) {
        await timer(item, TimerState.inMainInterval);
      }
    }
    await timer(coolDownTime, TimerState.inCoolingDown);
    state = TimerState.outOfProcess;
    notifyListeners();
  }
}
