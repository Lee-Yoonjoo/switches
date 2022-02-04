import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// TapboxA manages its own state.

//------------------------- MyApp ----------------------------------

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Managing state',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Managing state'),
          ),
          /*body: const Center(
          child: TapboxA(),
        ),
        */
          body: ListView(
              children : [

                const TapboxA(),
                const ParentWidget(),

              ]
          )

      ),
    );
  }
}

//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  const TapboxA({Key? key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Icon(
            Icons.lightbulb_outline,
            color: _active ? Colors.yellow.shade600 : Colors.black,
            size: 60
          ),
        ),
        width: 200.0,
        height: 200.0,
        /*decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),*/
      ),
    );
  }
}
//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  const TapboxB({
    Key? key,
    this.active = false,
    required this.onChanged,
  }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Icon(
              Icons.lightbulb_outline,
              color: active ? Colors.yellow.shade600 : Colors.black,
              size: 60
          ),
        ),
        width: 200.0,
        height: 200.0,
       /* decoration: BoxDecoration(
          color: active ? Colors.lightBlue[700] : Colors.grey[600],
        ),*/
      ),
    );
  }
}