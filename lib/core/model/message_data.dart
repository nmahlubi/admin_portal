class MessageData {
  String body;
  String title;
  String tag;
  String senderMessage;
  String orderId;

  MessageData(
      this.body, this.title, this.tag, this.senderMessage, this.orderId);

  MessageData.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    title = json['title'];
    tag = json['tag'];
    senderMessage = json['senderMessage'];
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body;
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.tag != null) {
      data['tag'] = this.tag;
    }
    if (this.senderMessage != null) {
      data['senderMessage'] = this.senderMessage;
    }
    if (this.orderId != null) {
      data['orderId'] = this.orderId;
    }

    return data;
  }
}