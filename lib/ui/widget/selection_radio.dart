import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';

class SelectionRadio extends StatefulWidget {
  final List<String> options;
  final TextEditingController sortController;

  const SelectionRadio({
    Key key,
    this.sortController,
    this.options,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SelectionRadioState();
}

class _SelectionRadioState extends State<SelectionRadio> {
  int _sortRadioGroup;

  void _handleSortRadioChange(int value) {
    setState(() {
      _sortRadioGroup = value;
      widget.sortController.text = widget.options[value];
    });
  }

  @override
  void initState() {
    _sortRadioGroup = widget.sortController.text != "" && widget.options != null
        ? widget.options
            .indexWhere((element) => element == widget.sortController.text)
        : -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController myScrollController = ScrollController();
    return DraggableScrollbar.arrows(
      alwaysVisibleScrollThumb: true,
      controller: myScrollController,
      backgroundColor: primaryColor,
      child: ListView.separated(
        controller: myScrollController,
        itemCount: widget.options.length,
        itemBuilder: (context, index) => RadioListTile(
          value: index,
          groupValue: _sortRadioGroup,
          onChanged: _handleSortRadioChange,
          title: Text(widget.options[index]),
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.black12,
        ),
      ),
    );
  }
}
