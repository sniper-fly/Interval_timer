import 'package:flutter/cupertino.dart';

class Controller extends ChangeNotifier {
  List<String> notes = [];

  void increment(String arg) {
    notes.add(arg);
    notifyListeners();
  }
}