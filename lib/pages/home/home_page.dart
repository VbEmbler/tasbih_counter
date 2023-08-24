import 'package:flutter/material.dart';
import 'package:tasbih_counter/pages/home/counter_panel.dart';
import 'package:tasbih_counter/pages/home/saved_tasbih_panel_landscape.dart';
import 'package:tasbih_counter/pages/home/saved_tasbih_panel_portait.dart';
import 'package:tasbih_counter/pages/home/toggle_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: MediaQuery.of(context).orientation == Orientation.portrait ? const Portrait() : const Landscape(),
    );
  }
}

class Portrait extends StatelessWidget {
  const Portrait({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 36, right: 15),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TogglePanel(),
            ),
            const CounterPanel(),
            const Padding(padding: EdgeInsets.only(bottom: 14.0)),
            getSavedTasbihPanel(context),
          ],
        ),
      ),
    );
  }
}

class Landscape extends StatelessWidget {
  const Landscape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        //physics: MediaQuery.of(context).orientation == Orientation.portrait ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 36, right: 15),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: TogglePanel(),
              ),
              const CounterPanel(),
              const Padding(padding: EdgeInsets.only(bottom: 14.0)),
              getSavedTasbihPanel(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getSavedTasbihPanel(BuildContext context) {
  if(MediaQuery.of(context).orientation == Orientation.portrait) {
    return const SavedTasbihPanelPortrait();
  }
  return const SavedTasbihPanelLandscape();
}
