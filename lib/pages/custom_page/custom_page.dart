import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class CustomPage extends StatefulWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  List<Album> myList = [];
  Future<void> getAlbum() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);

      List<Album> result = body.map((e) => Album.fromJson(e)).toList();
      setState(() {
        myList = result;
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
          backgroundColor: Colors.lightGreen,
          title: const Text('Custom Page'),
        ),
        body: Column(
          children: [
            TextButton(
              child: const Text(
                'Вернуться на главную',
              ),
              onPressed: () {
                //Navigator.popUntil(context, (route) => route.isFirst);
                //Navigator.popAndPushNamed(context, '/');
                //Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                context.go('/');
              },
            ),
            FilledButton(
              onPressed: () => getAlbum(),
              child: const Text('Получить список альбомов'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myList.length,
                itemBuilder: (context, index) {
              
                return ListTile(
                  title: Text(myList[index].title!),
                  leading: Text(myList[index].id.toString()),
                  subtitle: Text(myList[index].albumId.toString()),
                  trailing: Image.network(myList[index].thumbnailUrl!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Scaffold(
                          body:
                              Center(child: Image.network(myList[index].url!)),
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

List<Album> photosFromJson(String str) =>
    List<Album>.from(json.decode(str).map((x) => Album.fromJson(x)));

String photosToJson(List<Album> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Album {
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  Album({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
