import 'properties.dart';

class Route {
  String id;
  String type;
  List<List<double>> coordinates;
  Properties properties;

  Route(this.id, this.type, this.coordinates, this.properties);

  Route.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    coordinates = json.containsKey('coordinates') && json['coordinates']
        != null ? (json['coordinates'] as List).map(
            (data) => (data as List).map((innerData) => double.parse("$innerData")).toList()
    ).toList() : null;
    properties = json.containsKey('properties') && json['properties'] != null ? Properties.fromJson(json['properties']) :  null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.type != null) {
      data['type'] = this.type;
    }
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates;
    }
    if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }

    return data;
  }
}