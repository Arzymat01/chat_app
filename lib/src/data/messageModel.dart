class Message {
  Message({
    required this.sender,
    required this.sms,
    required this.dateTime,
    this.isMy,
  });
  final String sender;
  final String sms;
  final DateTime dateTime;
  bool? isMy;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'sender': sender,
      'sms': sms,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'isMy': isMy,
    };
  }

  factory Message.fromJson(Map<String, dynamic> map) {
    return Message(
      sender: map['sender'] as String,
      sms: map['sms'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      isMy: map['isMy'] != null ? map['isMy'] as bool : null,
    );
  }
}
