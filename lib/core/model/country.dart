class Country {
  String name;
  String code;

  Country(this.name, this.code);

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.code != null) {
      data['code'] = this.code;
    }

    return data;
  }
}