import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('a');
  }
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      height: 32,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
          color: Colors.grey,
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 1),
          )),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '1. A : 10, B : -10, C : -10, D : -10, E : 20',
            style: TextStyle(fontSize: 14),
          ),
          Icon(Icons.delete),
        ],
      ),
    );
  }
}
