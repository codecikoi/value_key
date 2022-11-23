import 'package:flutter/material.dart';

class ValueKeyDemo3 extends StatefulWidget {
  const ValueKeyDemo3({Key? key}) : super(key: key);

  @override
  State<ValueKeyDemo3> createState() => _ValueKeyDemo3State();
}

class _ValueKeyDemo3State extends State<ValueKeyDemo3> {
  // generate dummy data for the list view

  final List<String> _elements =
      List.generate(100, (index) => 'Element ${index.toString()}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3rd example of using Value Key'),
        centerTitle: true,
      ),
      body: ReorderableListView.builder(
          itemCount: _elements.length,
          itemBuilder: (context, index) {
            return Card(
              key: ValueKey(_elements[index]),
              color: Colors.grey,
              elevation: 1,
              margin: EdgeInsets.all(10),
              child: ListTile(
                trailing: Icon(Icons.drag_handle),
                subtitle: TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                contentPadding: EdgeInsets.all(25.0),
                title: Text(
                  _elements[index],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            );
          },

          // reorder function

          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex = newIndex - 1;
              }
              final element = _elements.removeAt(oldIndex);
              _elements.insert(newIndex, element);
            });
          }),
    );
  }
}
