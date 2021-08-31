import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxListTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final value;
  const CheckBoxListTile({Key key, this.value, this.subtitle, this.title})
      : super(key: key);

  @override
  _CheckBoxListTileState createState() => _CheckBoxListTileState();
}

class _CheckBoxListTileState extends State<CheckBoxListTile> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: value,
      onChanged: (value) {
        setState(() {
          value = value;
        });
      },
    ));
  }
}
