import 'package:flutter/material.dart';

class InputDateField extends StatelessWidget {
  const InputDateField(
      {Key key,
        this.child,
        this.labelText,
        this.valueText,
        this.valueStyle,
        this.onPressed,
        this.color,
        this.horizontalPadding = 15,
        this.verticalPadding = 0,
        this.horizontalMargin = 15,
        this.verticalMargin = 0})
      : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final double horizontalPadding;
  final double verticalPadding;
  final double horizontalMargin;
  final double verticalMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: verticalMargin),
      width: 400,
      alignment: Alignment.centerLeft,
      child: new InkWell(
        onTap: onPressed,
        child: new InputDecorator(
          decoration: new InputDecoration(
            labelText: labelText,
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          ),
          baseStyle: valueStyle,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(child: Text(valueText, style: valueStyle)),
              Icon(Icons.arrow_drop_down,
                  color: color != null ? color : Theme.of(context).brightness == Brightness.light
                      ? Colors.grey.shade700
                      : Colors.white70),
            ],
          ),
        ),
      ),
    );
  }
}