import 'package:flutter/material.dart';

class TogglePanelProvider extends ChangeNotifier {
  bool isActivity = true;

  void toggleActivity() {
    isActivity = !isActivity;
    notifyListeners();
  }
}
