import 'package:flutter/material.dart';

class ValueKeyDemo2 extends StatefulWidget {
  const ValueKeyDemo2({Key? key}) : super(key: key);

  @override
  State<ValueKeyDemo2> createState() => _ValueKeyDemo2State();
}

class _ValueKeyDemo2State extends State<ValueKeyDemo2> {
  bool showEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Value Key example 2'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showEmail)
              TextField(
                key: ValueKey(MyObject('email')),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.email),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            TextField(
              key: ValueKey(MyObject('email')),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.people),
                labelText: 'Username',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: Colors.grey,
          textStyle: TextStyle(fontSize: 20),
        ),
        icon: Icon(Icons.visibility_off),
        label: Text('remove email'),
        onPressed: () => setState(() {
          showEmail = false;
        }),
      ),
    );
  }
}

class MyObject {
  final String keyString;

  MyObject(this.keyString);

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is MyObject &&
          runtimeType == other.runtimeType &&
          keyString == other.keyString;

  @override
  int get hashCode => keyString.hashCode;
}
