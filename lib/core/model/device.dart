class Device {
  String deviceType;
  String fcmToken;
  String uniqueId;
  String hcmToken;

  Device(this.deviceType, this.fcmToken, this.uniqueId, this.hcmToken);

  Device.fromJson(Map<String, dynamic> json) {
    deviceType = json['deviceType'];
    fcmToken = json['fcmToken'];
    uniqueId = json['uniqueId'];
    hcmToken = json['hcmToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deviceType != null) {
      data['deviceType'] = this.deviceType;
    }
    if (this.fcmToken != null) {
      data['fcmToken'] = this.fcmToken;
    }
    if (this.uniqueId != null) {
      data['uniqueId'] = this.uniqueId;
    }
    if (this.hcmToken != null) {
      data['hcmToken'] = this.hcmToken;
    }
    return data;
  }
}