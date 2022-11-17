import 'package:flutter/material.dart';


class ValueKeyDemo1 extends StatefulWidget {
  const ValueKeyDemo1({Key? key}) : super(key: key);

  @override
  State<ValueKeyDemo1> createState() => _ValueKeyDemo1State();
}

class _ValueKeyDemo1State extends State<ValueKeyDemo1> {
  
  late int counter;
  
  @override 
  void initState() {
    print('# ValuKeyDemo1 init state');
    counter = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('ValuKey')
    return Container();
  }
}
