import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  final Function(String) onSelection;
  final Function(String) onTextChange;

  const SearchFilter(
      {Key key, this.onSelection, this.onTextChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchFilterWidgetState();
}

class SearchFilterWidgetState extends State<SearchFilter> {
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";

  SearchFilterWidgetState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text.isEmpty ? "" : _filter.text;
      });
      widget.onTextChange(_searchText);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          height: 60.0,
          child: new TextField(
            controller: _filter,

            decoration: InputDecoration(

                hintText: "Search Here",
                suffixIcon: Icon(Icons.search,color:primaryColor,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)))),
          ),
        ),
      ],
    );
  }
}
