import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<Todo> myTodoList = [];
  Future<void> getAlbum() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);

      List<Todo> result = body.map((e) => Todo.fromJson(e)).toList();
      setState(() {
        myTodoList = result;
      });
    } else {
      print('Проблема');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
          title: const Text('ToDo Page'),
        ),
        body: Column(
          children: [
            TextButton(
              child: const Text(
                'Вернуться на главную',
              ),
              onPressed: () {
                context.go('/');
              },
            ),
            FilledButton(
              onPressed: () => getAlbum(),
              child: const Text('Получить список Todoшeк'),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: myTodoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(myTodoList[index].title ?? 'Нет описания'),
                      leading: Text(myTodoList[index].id.toString()),
                      subtitle: Text(myTodoList[index].userId.toString()),
                      trailing: myTodoList[index].completed!
                          ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                            ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => Scaffold(
                              body: Center(
                                child: Text(
                                  myTodoList[index].title ?? 'Нет описания',
                                  style: const TextStyle(fontSize: 38),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

List<Todo> todoFromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  Todo({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
