import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';

class Controller extends ChangeNotifier {
  List<String> notes = [];
  int timer = 10;

  void increment(String arg) {
    notes.add(arg);
    notifyListeners();
  }

  void time_decrement() {
    while (timer > 0) {
      sleep(Duration(seconds: 1));
      timer--;
    }
  }
}