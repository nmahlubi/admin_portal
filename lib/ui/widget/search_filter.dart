import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  final Function(String) onTextChange;

  const SearchFilter({Key key, this.onTextChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchFilterWidgetState();
}

class SearchFilterWidgetState extends State<SearchFilter> {
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  bool textFieldActive = false;

  @override
  void initState() {
    super.initState();
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text.isEmpty ? "" : _filter.text;
      });
      widget.onTextChange(_searchText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: new TextField(
          style: greyTexts,
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintText: 'Search...',
          )),
    );
  }
}
