import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerList extends StatefulWidget {
  final List<String> playerList;

  const PlayerList(this.playerList, {super.key});

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  late List<String> playerList;

  Widget player(String name) {
    return Expanded(
      child: InkWell(
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
            left: BorderSide(color: Colors.black, width: 0.5),
            right: BorderSide(color: Colors.black, width: 0.5),
          )),
          alignment: Alignment.center,
          height: 48,
          child: Text(name),
        ),
        onTap: () {
          setState(() {

          });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    playerList = widget.playerList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: playerList.map((name) => player(name)).toList(),
    );
  }
}
