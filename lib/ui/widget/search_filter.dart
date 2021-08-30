import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/user_dto.dart';
import 'package:Live_Connected_Admin/core/viewmodel/user_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/view/base_view.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dropdown_selection_field.dart';
import 'dropdown_selection_widget.dart';

class SearchFilter extends StatefulWidget {
  final Function(String) onSelection;
  final Function(String) onTextChange;
  final Function pressClose;
  final bool closeSearch;

  SearchFilter(
      {Key key,
      this.onSelection,
      this.onTextChange,
      this.closeSearch = false,
      this.pressClose})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchFilterWidgetState();
}

class SearchFilterWidgetState extends State<SearchFilter> {
  final TextEditingController _filter = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _controller = ScrollController();
  String _searchText = "";
  ClientUserDto clientUserDto;
  UserDto userDto;

  @override
  Widget build(BuildContext context) {
    ClientUserDto user = Provider.of<ClientUserDto>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async => true,
        child: BaseView<UserModel>(onModelReady: (model) {
          model.getUsers(initController: () {
            _controller.addListener(() {
              if (_controller.position.pixels ==
                  _controller.position.maxScrollExtent) {
                model.getUsers();
              }
            });
          });

          model.user = user;
        }, builder: (BuildContext context, UserModel model, Widget child) {
          return Row(
            children: [
              widget.closeSearch
                  ? IconButton(
                      icon: new Icon(Icons.close),
                      //iconSize: 35,
                      onPressed: widget.pressClose,
                    )
                  : Container(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 60.0,
                  child: new TextField(
                    onSubmitted: (_searchText) {
                      _filter.addListener(() {
                        setState(() {
                          _searchText =
                              _filter.text.isEmpty ? "" : _filter.text;
                        });
                        widget.onTextChange(_searchText);
                      });
                    },
                    style: greyTexts,
                    controller: _filter,
                    decoration: new InputDecoration(
                      // suffixIcon: PopupMenuButton<String>(
                      //   icon: Icon(Icons.arrow_drop_down),
                      // ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.blueGrey,
                      ),
                      hintText: 'Search (Press enter to search)',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Text('filter by'),
              Container(
                child: ListView.builder(
                  itemCount: model.usersFilter.length,
                  itemBuilder: (context, index) => DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text("${model.usersFilter[index].created}"),
                      ),
                      DropdownMenuItem(
                        child: Text("${model.usersFilter[index].firstName}"),
                      ),
                      DropdownMenuItem(
                        child: Text("${model.usersFilter[index].activeOnApp}"),
                      ),
                      DropdownMenuItem(
                        child: Text(
                            "${model.usersFilter[index].activeSubscription}"),
                      )
                    ],
                    onTap: () {
                      setState(() {});
                    },
                  ),
                ),
              ),
              Text('sort by'),
              Container(
                child: ListView.builder(
                  itemCount: model.usersFilter.length,
                  itemBuilder: (context, index) => DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text("Ase"),
                      ),
                      DropdownMenuItem(
                        child: Text("Desc"),
                        value: 2,
                      ),
                    ],
                    onTap: () {
                      setState(() {});
                    },
                  ),
                ),
              )
            ],
          );
        }));
  }
}
