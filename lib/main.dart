import 'package:favo_changenotifier/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('favorite-list'),
      ),
      body: Consumer(builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
        final model = watch(controller);
        return ListView(
          children: model.sampleData
              .map((e) => Container(
            child: Row(
              children: [
                IconButton(
                    onPressed: (){
                      print(e.isFavo);
                      e.isFavo = model.changeBool(e.isFavo, e.iConsColour)[0];
                      e.iConsColour = model.changeBool(e.isFavo, e.iConsColour)[1];
                    },
                    icon: Icon(Icons.favorite, color: e.iConsColour),),
                Text(e.word),
              ],
            ),
          )).toList()
        );
      },
      ),
    );
  }
}
