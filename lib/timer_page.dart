import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'controller.dart';

class TimerPage extends StatelessWidget {
  final context;
  TimerPage(this.context);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(Provider.of<Controller>(context).timer.toString()),
        IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            Provider.of<Controller>(context, listen: false).timeDecrement();
          },
        )
      ],
    );
  }
}

//旧バージョンの保存
class MyHomePageDup extends StatelessWidget {
  MyHomePageDup({Key key, this.title}) : super(key: key);//ここ何してるんだっけ
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: Provider.of<Controller>(context).notes.length,
        itemBuilder: (context, index) {
          return
            ListTile(
              title: Text(Provider.of<Controller>(context).notes[index]),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        /*changeNで値が変更されたときにそれを参照するかどうか*/
        onPressed: () {
          final createNote = Provider.of<Controller>(context, listen: false).increment;
          showDialog(
            context: context,
            builder: (context) {
              final TextEditingController textEditingController = TextEditingController();
              return AlertDialog(
                title: Text('enter title'),
                content: TextField(controller: textEditingController),
                actions: <Widget>[
                  FlatButton(
                    child: Text('CANCEL'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      createNote(textEditingController.text);
                      Navigator.pop(context);
//                      print(textEditingController.text);
                    },
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
