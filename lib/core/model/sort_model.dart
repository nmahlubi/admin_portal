class FilterModel {
  String firstName;
  DateTime created;
  bool activeOnApp;
  bool activeSubscription;

  FilterModel(
      {this.firstName,
      this.created,
      this.activeOnApp,
      this.activeSubscription});
}
