import 'package:flutter/material.dart';
import '../../model/check_list.dart';

class CheckboxListPage extends StatefulWidget {
  @override
  _CheckboxListPageState createState() {
    return _CheckboxListPageState();
  }
}

class _CheckboxListPageState extends State<CheckboxListPage> {
  List<CheckList> _list;

  Widget getListCheckbox() {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context, index) {
        CheckList checkList = _list[index];
        return CheckboxListTile(
          title: Text(checkList.title),
          value: checkList.checked,
          onChanged: (value) {
            setState(() {
              checkList.checked = value;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('能够选择的列表'),
        ),
        body: getListCheckbox());
  }

  @override
  void initState() {
    super.initState();
    _list = List();
    for (int i = 0; i < 10; i++) {
      CheckList checkList =
          new CheckList((i + 1), "item" + (i + 1).toString(), false);
      _list.add(checkList);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
