import 'package:flutter/material.dart';

class ChipPage extends StatefulWidget {
  @override
  _ChipPageState createState() {
    return _ChipPageState();
  }
}

class _ChipPageState extends State<ChipPage> {
  List list;
  String selectedItem = '苹果';

  List<String> selected = [];

  @override
  void initState() {
    super.initState();
    list = List();
    list.addAll(['苹果', '香蕉', '橘子']);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          getChip(),
          getActionShip(),
          getListChip(),
          getListChipMore()
        ],
      ),
    );
  }

  Widget getChip() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: list.map((item) {
        return Chip(
          label: Text(item),
          onDeleted: () {
            setState(() {
              list.remove(item);
            });
          },
        );
      }).toList(),
    );
  }

  Widget getActionShip() {
    return ActionChip(
      avatar: CircleAvatar(
        backgroundImage: NetworkImage(
            "http://imgsrc.baidu.com/imgad/pic/item/cc11728b4710b91250f4e5dbc9fdfc03924522d9.jpg"),
      ),
      label: Text('苹果'),
      onPressed: () {
        print(1);
      },
    );
  }

  Widget getListChip() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: list.map((item) {
        return ChoiceChip(
          label: Text(item),
          selected: item == selectedItem,
          selectedColor: Colors.red,
          onSelected: (val) {
            setState(() {
              selectedItem = item;
            });
          },
        );
      }).toList(),
    );
  }

  Widget getListChipMore() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: list.map((item) {
        return ChoiceChip(
          label: Text(item),
          selectedColor: Colors.red,
          labelStyle: TextStyle(
              color: selected.contains(item) ? Colors.white : Colors.black),
          selected: selected.contains(item),
          onSelected: (value) {
            setState(() {
              if (selected.contains(item)) {
                selected.remove(item);
              } else {
                selected.add(item);
              }
            });
          },
        );
      }).toList(),
    );
  }
}
