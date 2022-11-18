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
    print('# ValueKeyDemo1 init state');
    counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('ValueKeyDemo1 -- call method build context');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Value Key example 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScaleAnimated(
              duration: Duration(
                seconds: 2,
              ),
              child: Text(
                'widget without key: $counter',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ScaleAnimated(
              duration: Duration(
                seconds: 2,
              ),
              child: Text(
                'widget with key: $counter',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.grey,
                textStyle: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              child: Text('push'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScaleAnimated extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ScaleAnimated({
    Key? key,
    required this.child,
    required this.duration,
  }) : super(key: key);

  @override
  State<ScaleAnimated> createState() => _ScaleAnimatedState();
}

class _ScaleAnimatedState extends State<ScaleAnimated>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    print('ScaleANimated initstate');
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      upperBound: 1.0,
      lowerBound: 0.0,
    );
    _controller.forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
