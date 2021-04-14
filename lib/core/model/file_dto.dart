class FileDto {
  String name;
  String path;
  int fileType;

  FileDto(this.name, this.path, this.fileType);

  FileDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    path = json['path'];
    fileType = json['fileType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.path != null) {
      data['path'] = this.path;
    }
    if (this.fileType != null) {
      data['fileType'] = this.fileType;
    }
    return data;
  }
}