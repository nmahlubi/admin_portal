class Properties {
  double distance;
  String description;
  String traveltime;

  Properties(this.distance, this.description, this.traveltime);

  Properties.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
    description = json['description'];
    traveltime = json['traveltime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.distance != null) {
      data['distance'] = this.distance;
    }
    if (this.description != null) {
      data['description'] = this.description;
    }
    if (this.traveltime != null) {
      data['traveltime'] = this.traveltime;
    }

    return data;
  }
}