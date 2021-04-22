import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  final Function(String) onSelection;
  final Function(String) onTextChange;

  const SearchFilter({Key key, this.onSelection, this.onTextChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchFilterWidgetState();
}

class SearchFilterWidgetState extends State<SearchFilter> {
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          height: 60.0,
          child: new TextField(
              onSubmitted: (_searchText) {
                _filter.addListener(() {
                  setState(() {
                    _searchText = _filter.text.isEmpty ? "" : _filter.text;
                  });
                  widget.onTextChange(_searchText);
                });
              },
              style: greyTexts,
              controller: _filter,
              decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Search...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)))
              ))
        ),
      ],
    );
  }
}
