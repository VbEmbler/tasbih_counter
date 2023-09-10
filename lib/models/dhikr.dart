class Dhikr {
  int counter;
  String title;
  DateTime date;

  Dhikr({
    required this.counter,
    required this.title,
    required this.date,
  });

  void save() { }

  void delete() {}
}

List<Dhikr> fakeDB = [];