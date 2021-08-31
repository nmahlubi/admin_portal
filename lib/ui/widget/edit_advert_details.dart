import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/plain_text_field.dart';
import 'package:Live_Connected_Admin/ui/widget/upload_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cell_text_field.dart';
import 'check_listtile.dart';
import 'email_text_field.dart';
import 'input_date_field.dart';
import 'labelled_check_box_widget.dart';

class EditAdvertDetails extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  final TextEditingController cellNumberController;
  final TextEditingController descriptionController;

  final TextEditingController emailAddressController;
  final TextEditingController categoryController;
  final TextEditingController subcategoryController;
  final TextEditingController ownerController;
  final TextEditingController carouselImageController;
  final TextEditingController idController;
  final TextEditingController mainImageUrlController;
  final TextEditingController createdController;
  final TextEditingController likesController;
  final TextEditingController modifiedController;
  final TextEditingController activeController;
  final TextEditingController backgroundController;
  final TextEditingController facebookLinkController;
  final TextEditingController buttonTextController;
  final TextEditingController addToCarouselController;
  final TextEditingController alertListController;
  final TextEditingController viewsController;
  final TextEditingController websiteController;
  final TextEditingController twitterLinkController;
  final TextEditingController iconUrlController;
  final TextEditingController subCategoryController;

  const EditAdvertDetails({
    Key key,
    this.titleController,
    this.subtitleController,
    this.descriptionController,
    this.cellNumberController,
    this.emailAddressController,
    this.categoryController,
    this.subcategoryController,
    this.ownerController,
    this.carouselImageController,
    this.idController,
    this.mainImageUrlController,
    this.createdController,
    this.likesController,
    this.modifiedController,
    this.activeController,
    this.backgroundController,
    this.facebookLinkController,
    this.buttonTextController,
    this.addToCarouselController,
    this.alertListController,
    this.viewsController,
    this.websiteController,
    this.twitterLinkController,
    this.iconUrlController,
    this.subCategoryController,
  }) : super(key: key);

  @override
  _EditAdvertDetailsState createState() => _EditAdvertDetailsState();
}

class _EditAdvertDetailsState extends State<EditAdvertDetails> {
  DateTime selectedDate;
  String selectedGender;

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Divider(
          color: primaryColor,
          height: 3,
        ),
        UIHelper.verticalSpaceMediumLarge(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  child: PlainTextField(
                    controller: widget.titleController,
                    hint: 'Company title',
                  ),
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.subtitleController,
                  hint: 'Company subtitle',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.cellNumberController,
                  hint: 'Cell Number',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.descriptionController,
                  hint: 'Advert Description',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.emailAddressController,
                  hint: 'Email Address',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.categoryController,
                  hint: 'Category',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.backgroundController,
                  hint: 'Background',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.facebookLinkController,
                  hint: 'Facebook',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.buttonTextController,
                  hint: 'ButtonText',
                ),
                UIHelper.verticalSpaceXSmall(),
              ],
            ),
            Column(
              children: [
                PlainTextField(
                  controller: widget.websiteController,
                  hint: ' Website',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.subCategoryController,
                  hint: 'Subcategory',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.twitterLinkController,
                  hint: 'Twitter Link',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.createdController,
                  hint: 'Date Created',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.likesController,
                  hint: 'Likes',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.modifiedController,
                  hint: 'Modified',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.activeController,
                  hint: 'Active',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.ownerController,
                  hint: 'Owner',
                ),
                UIHelper.verticalSpaceXSmall(),
                PlainTextField(
                  controller: widget.idController,
                  hint: 'Id',
                ),
                UIHelper.verticalSpaceXSmall(),
              ],
            )
          ],
        ),
        UIHelper.verticalSpaceMediumLarge(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 200,
                  height: 50,
                  child: FlatButton(
                    child: Text('Upload Banner'),
                    color: primaryColor,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: FlatButton(
                    child: Text('Upload IconUrl'),
                    color: primaryColor,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: FlatButton(
                    child: Text('Upload MainImage'),
                    color: primaryColor,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
        UIHelper.verticalSpaceMediumLarge(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 900,
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Please add to carouselImage'),
                value: value,
                onChanged: (value) {
                  setState(() {
                    value = value;
                  });
                },
              ),
            ),
            Container(
                height: 100,
                width: 850,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 70,
                      width: 200,
                      child: FlatButton(
                        child: Text('Add Advert'),
                        color: primaryColor,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    )
                  ],
                )),
          ],
        ),
        UIHelper.verticalSpaceMediumLarge(),
      ],
    );
  }
}
