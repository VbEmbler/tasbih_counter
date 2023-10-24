import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasbih_counter/models/dhikr.dart';

class HiveProvider extends ChangeNotifier {
  late Box<Dhikr> dhikrs;

  HiveProvider() {
    openBox();
  }

  Future<void> openBox() async {
    dhikrs = await Hive.openBox('dhikrBox');
  }

  Future<void> saveDhikr(Dhikr dhikr) async {
    dhikrs.add(dhikr);
  }

  editDhikr(int index, Dhikr dhikr) {
    dhikrs.putAt(index, dhikr);
  }

  deleteDhikr(int index) {
    dhikrs.deleteAt(index);
  }

  @override
  void dispose() {
    dhikrs.close();
    super.dispose();
  }
}
