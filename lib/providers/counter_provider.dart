import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterProvider extends ChangeNotifier {
  int tasbihCount = 0;

  CounterProvider()  {
    getTasbihCounterFromPrefs();
  }



  Future<void> getTasbihCounterFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('tasbihCount')) {
      tasbihCount = prefs.getInt('tasbihCount') ?? 0;
      notifyListeners();
    }
  }

  Future<void> zeroing() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (tasbihCount > 0) {
      tasbihCount = 0;
      notifyListeners();
    }
    prefs.setInt('tasbihCount', 0);
  }

  Future<void> increment() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    tasbihCount++;
    notifyListeners();

    prefs.setInt('tasbihCount', tasbihCount);
  }

  Future<void> decrement() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (tasbihCount > 0) {
      tasbihCount--;
      notifyListeners();
    }
    prefs.setInt('tasbihCount', tasbihCount);
  }
}
