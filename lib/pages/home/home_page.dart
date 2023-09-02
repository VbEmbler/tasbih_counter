import 'package:flutter/material.dart';
import 'package:tasbih_counter/pages/home/counter_panel.dart';
import 'package:tasbih_counter/pages/home/saved_tasbih_panel.dart';
import 'package:tasbih_counter/pages/home/toggle_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isActivity = true;

  void toggleActivity() {
    setState(() {
      isActivity = !isActivity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 36, right: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TogglePanel(isActivity, toggleActivity),
              ),
              Visibility(
                visible: isActivity,
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 14.0),
                  child: CounterPanel(),
                ),
              ),
              const SavedTasbihPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
