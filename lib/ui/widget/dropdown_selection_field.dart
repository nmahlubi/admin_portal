import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/selection_radio.dart';
import 'package:flutter/material.dart';

import 'input_selection_field.dart';

class DropdownSelectionField extends StatefulWidget {
  final List<String> options;
  final TextEditingController controller;
  final String hint;
  final bool boarder;
  final double horizontalPadding;
  final double horizontalContentPadding;
  final bool customHint;
  final bool borderRadiusPresent;
  final double width;
  final Color color;
  final BorderRadius borderRadius;
  final Function(String) onCloseDialog;

  const DropdownSelectionField(
      {Key key,
      this.controller,
      this.hint,
      this.boarder,
      this.horizontalPadding,
      this.horizontalContentPadding,
      this.customHint,
      this.borderRadiusPresent,
      this.borderRadius = UIHelper.textFieldBorderRadiusAllCircular,
      this.width,
      this.options,
      this.color,
      this.onCloseDialog})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => DropdownSelectionFieldState();
}

class DropdownSelectionFieldState extends State<DropdownSelectionField> {
  @override
  Widget build(BuildContext context) {
    return InputSelectionField(
      color: widget.color,
      hint: widget.hint,
      valueText: widget.controller.text.isNotEmpty
          ? widget.controller.text
          : "Please Select",
      horizontalPadding: widget.horizontalPadding,
      boarder: widget.boarder,
      horizontalContentPadding: widget.horizontalContentPadding,
      customHint: widget.customHint,
      borderRadiusPresent: widget.borderRadiusPresent,
      width: widget.width,
      onPressed: () async {
        await _selectOption(context);
        FocusScope.of(context).unfocus();
      },
      borderRadius: widget.borderRadius,
    );
  }

  Future<void> _selectOption(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(widget.hint),
            content: Container(
              height: 400,
              width: 400,
              child: Column(
                children: [
                  Text("${widget.controller.text}"),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(
                    child: SelectionRadio(
                      sortController: widget.controller,
                      options: widget.options,
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    if (widget.onCloseDialog != null) {
                      widget.onCloseDialog(widget.controller.text);
                    }
                  });
                },
              ),
            ],
          );
        });
  }
}
