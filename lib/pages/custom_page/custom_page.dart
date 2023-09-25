import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          title: const Text('Custom Page'),
        ),
        body: TextButton(
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
      ),
    );
  }
}
