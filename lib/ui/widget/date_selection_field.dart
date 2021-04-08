import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'input_selection_field.dart';

class DateSelectionField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool boarder;
  final double horizontalPadding;
  final double horizontalContentPadding;
  final bool customHint;
  final bool borderRadiusPresent;
  final double width;
  final String dateFormat;
  final Color color;
  final BorderRadius borderRadius;

  DateSelectionField(
      {Key key,
      this.controller,
      this.hint,
      this.boarder,
      this.horizontalPadding,
      this.horizontalContentPadding,
      this.customHint,
      this.borderRadiusPresent,
      this.width,
      this.dateFormat = "yyyy-MM-dd",
      this.borderRadius = UIHelper.textFieldBorderRadiusAllCircular,
      this.color = widgetBgColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => DateSelectionFieldState();
}

class DateSelectionFieldState extends State<DateSelectionField> {
  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    selectedDate =
        widget.controller.text != null && widget.controller.text.isNotEmpty
            ? DateTime.parse(widget.controller.text)
            : DateTime.now();
    return InputSelectionField(
      hint: widget.hint,
      valueText: new DateFormat(widget.dateFormat).format(selectedDate),
      horizontalPadding: widget.horizontalPadding,
      boarder: widget.boarder,
      horizontalContentPadding: widget.horizontalContentPadding,
      customHint: widget.customHint,
      borderRadiusPresent: widget.borderRadiusPresent,
      width: widget.width,
      color: widget.color,
      onPressed: () async {
        await _selectDate(context);
        FocusScope.of(context).unfocus();
      },
      borderRadius: widget.borderRadius,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: new DateTime(1920, 8),
      lastDate: new DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      _handleDateChange(picked);
    }
  }

  void _handleDateChange(DateTime newValue) {
    print("Selected Date: ${newValue.toIso8601String()}");
    setState(() {
      selectedDate = newValue;
    });

    widget.controller.text = newValue.toIso8601String();
  }
}
