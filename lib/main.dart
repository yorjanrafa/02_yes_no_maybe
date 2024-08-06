import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Yes no app'),
        ),
        body: Center(
          child: FilledButton.tonal(
              onPressed: () {
                print('me ha clickeado');
              },
              child: const Text('Yes')),
        ),
      ),
    );
  }
}
