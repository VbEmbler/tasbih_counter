import 'package:flutter/material.dart';
import 'package:tasbih_counter/pages/home/counter_panel.dart';
import 'package:tasbih_counter/pages/home/saved_tasbih_panel.dart';
import 'package:tasbih_counter/pages/home/toggle_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: TogglePanel(),
              ),
              CounterPanel(),
              const Padding(padding: EdgeInsets.only(bottom: 14.0)),
              const SavedTasbihPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
