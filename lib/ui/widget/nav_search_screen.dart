import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/viewmodel/search_model.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/view/base_view.dart';
import 'package:Live_Connected_Admin/ui/widget/search_filter.dart';
import 'package:Live_Connected_Admin/ui/widget/users_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SearchModel>(onModelReady: (model) {
      model.getUsers();
    }, builder: (BuildContext context, SearchModel model, Widget child) {
      return Column(
        children: [
          SearchFilter(
            onTextChange: (searchTerm) {
              model.search(searchTerm);
            },
          ),
          UIHelper.verticalSpaceSmall(),
          model.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator())
              : model.errorMessage != null
                  ? Center(
                      child: Text(
                      model.errorMessage,
                      style: errorStyleRed,
                      textAlign: TextAlign.center,
                    ))
                  : Expanded(
                      child: Column(
                        children: [
                          UIHelper.verticalSpaceSmall(),
                          model.usersList.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: model.usersList.length,
                                    itemBuilder: (context, index) {
                                      return UsersListItem(
                                        item: model.usersList[index],
                                      );
                                    },
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
        ],
      );
    });
  }
}
