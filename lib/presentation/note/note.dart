import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note"),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
