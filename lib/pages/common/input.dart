import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() {
    return _InputPageState();
  }
}

class _InputPageState extends State<InputPage> {
  Widget getRowTitle(String title) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  //组件
  //输入框
  Widget getTextField() {
    return TextField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: '示例'),
    );
  }

  //checkbox
  Widget getCheckBox() {
    return CheckboxListTile(
      title: Text('选项1'),
      value: true,
      onChanged: (value) {},
    );
  }

  //radio
  Widget getRadio() {
    return RadioListTile(
      title: Text('选项2'),
      groupValue: true,
      value: true,
      onChanged: (value) {},
    );
  }

  //普通下拉框
  Widget getSelect() {
    return DropdownButton(
      isExpanded: true,
      onChanged: (value) {
        print(value);
      },
      hint: Text('请选择'),
      value: null,
      items: <DropdownMenuItem>[
        DropdownMenuItem(
          child: Text('123'),
          value: 123,
        ),
        DropdownMenuItem(
          child: Text('456'),
          value: 456,
        )
      ],
    );
  }

  //选择时间   这边使用的第三方
  Widget getDatePicker() {
    return OutlineButton(
      child: Text('选择时间'),
      onPressed: () {
        DatePicker.showDatePicker(context,
            showTitleActions: true,
            // minTime: DateTime(2018, 3, 5),
            // maxTime: DateTime(2019, 6, 7),
            theme: DatePickerTheme(
                backgroundColor: Colors.white,
                itemStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                doneStyle: TextStyle(color: Colors.blue, fontSize: 16),
                cancelStyle: TextStyle(color: Colors.blue, fontSize: 16)),
            onChanged: (date) {
          print('change $date');
        }, onConfirm: (date) {
          print('confirm $date');
        }, currentTime: DateTime.now(), locale: LocaleType.zh);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        getRowTitle('输入框'),
        getTextField(),
        getRowTitle('多选'),
        getCheckBox(),
        getRowTitle('单选'),
        getRadio(),
        getRowTitle('下拉框'),
        getSelect(),
        getRowTitle('日期组件【使用第三方】'),
        getDatePicker()
      ],
    );
  }
}
