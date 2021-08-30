import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/app_themes.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/plain_text_field.dart';
import 'package:Live_Connected_Admin/ui/widget/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cell_text_field.dart';
import 'email_text_field.dart';
import 'input_date_field.dart';
import 'labelled_check_box_widget.dart';

class EditAdvertDetails extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  final TextEditingController cellNumberController;
  final TextEditingController descriptionController;

  const EditAdvertDetails({
    Key key,
    this.titleController,
    this.subtitleController,
    this.descriptionController,
    this.cellNumberController,
  }) : super(key: key);
  @override
  _EditAdvertDetailsState createState() => _EditAdvertDetailsState();
}

class _EditAdvertDetailsState extends State<EditAdvertDetails> {
  DateTime selectedDate;
  String selectedGender;

  @override
  Widget build(BuildContext context) {
    selectedDate = widget.titleController.text != null &&
            widget.titleController.text.isNotEmpty
        ? DateTime.parse(widget.titleController.text)
        : DateTime.now();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        UIHelper.verticalSpaceXSmall(),
        Align(
          alignment: Alignment.center,
          child: Text(
            'ADVERT INFORMATION',
            style: TextStyle(fontSize: 30, color: primaryColor),
          ),
        ),
        UIHelper.verticalSpaceXSmall(),
        UIHelper.verticalSpaceXSmall(),
        TextFieldWidget(
          controller: widget.titleController,
          hintText: 'Company title',
        ),
        UIHelper.verticalSpaceXSmall(),
        TextFieldWidget(
          controller: widget.subtitleController,
          hintText: 'Company subtitle',
        ),
        UIHelper.verticalSpaceXSmall(),
        TextFieldWidget(
          controller: widget.cellNumberController,
          hintText: 'Company Contact',
        ),
        UIHelper.verticalSpaceXSmall(),
        TextFieldWidget(
          controller: widget.descriptionController,
          hintText: 'Company Description',
        ),
        Container(
          width: 500,
          child: InputDateField(
            labelText: 'Date',
            valueText: new DateFormat.yMMMd().format(selectedDate),
            horizontalPadding: 0,
            //valueStyle: valueStyle,
            onPressed: () {
              _selectDate(context);
              FocusScope.of(context).unfocus();
            },
          ),
        ),
        UIHelper.verticalSpaceXSmall(),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: new DateTime(1920, 8),
      lastDate: new DateTime.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: dateSectionTheme(context),
          child: child,
        );
      },
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

    widget.cellNumberController.text = newValue.toIso8601String();
  }

  @override
  void initState() {
    print(widget.titleController.text);
    super.initState();
  }
}
