import 'dart:ffi';

import 'package:english_words/english_words.dart';
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
      title: 'Switch List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Switch List'),
        ),
        body: const Center(
          child: SwitchList(),
        ),
      ),
    );
  }
}

class SwitchList extends StatefulWidget {
  const SwitchList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SwitchListState();
}

class _SwitchListState extends State<SwitchList> {
  List<SwitchItemModel> switchItems = [
    SwitchItemModel('Living Room', false, Icons.living_outlined),
    SwitchItemModel('Kitchen', false, Icons.kitchen_outlined),
    SwitchItemModel('Bathroom', false, Icons.bathroom_outlined),
    SwitchItemModel('Bedroom', false, Icons.bed_outlined),
    SwitchItemModel('Office', false, Icons.laptop_mac_outlined),
    SwitchItemModel('Dining Room', false, Icons.local_dining_outlined),
  ];

  void _handleTap(int index, bool isOn) {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: switchItems.length,
                itemBuilder: (context, index) {
                  final switchItem = switchItems[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle light when tapped.
                        switchItem.isOn = !switchItem.isOn;
                      });
                    },
                    child: Container(
                      child: Center(
                        child: Icon(switchItem.icon,
                            color: switchItem.isOn
                                ? Colors.yellow.shade600
                                : Colors.black,
                            size: 60),
                      ),
                      height: 100,
                      width: 100,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildHorizontalList() {
  return SizedBox(
    height: 200,
    width: 200,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        _tile('Living Room', false, Icons.living_outlined),
        _tile('Kitchen', false, Icons.kitchen_outlined),
        _tile('Bathroom', false, Icons.bathroom_outlined),
        _tile('Bedroom', false, Icons.bed_outlined),
        _tile('Office', false, Icons.laptop_mac_outlined),
        _tile('Dining Room', false, Icons.local_dining_outlined),
      ],
    ),
  );
}

ListTile _tile(String name, bool isOn, IconData icon) {
  return ListTile(
/*    title: Text(name,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),*/
    selected: isOn,
    leading: Icon(
      icon,
      color: isOn ? Colors.yellow.shade600 : Colors.black,
      size: 60,
    ),
  );
}

class SwitchItemModel {
  SwitchItemModel(this.name, this.isOn, this.icon);

  String name;
  bool isOn;
  IconData icon;
}
