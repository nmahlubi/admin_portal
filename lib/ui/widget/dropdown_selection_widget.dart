import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownSelectionWidget extends StatelessWidget {
  final String asc;
  final String desc;
  const DropdownSelectionWidget({
    Key key,
    this.asc,
    this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        items: <String>[
          'ASC',
          'DESC',
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
