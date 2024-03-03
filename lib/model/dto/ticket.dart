class TicketDto {
  const TicketDto({
    this.subject,
    this.ticketState,
    this.priority,
    this.trackingCode,
    this.id,
    this.createDate,
    this.desc,
    this.applicationUserFullName,
  });

  final String? subject;
  final int? ticketState;
  final int? priority;
  final String? trackingCode;
  final int? id;
  final String? createDate;
  final String? desc;
  final String? applicationUserFullName;

  static TicketDto fromJson(json) {
    return TicketDto(
      subject: json['subject'],
      ticketState: json['ticketState'],
      priority: json['priority'],
      trackingCode: json['applicationUserUserPicUrl'],
      id: json['id'],
      createDate: json['createDate'],
      desc: json['desc'],
      applicationUserFullName: json['applicationUserFullName'],
    );
  }
}

class Chat {
  const Chat({
    this.desc,
    this.ticketAnswerState,
    this.isSeen,
    this.createDate,
    this.id,
    this.isClient,
  });

  final String? desc;
  final int? ticketAnswerState;
  final bool? isSeen;
  final int? id;
  final int? createDate;
  final bool? isClient;

  static Chat fromJson(json) {
    return Chat(
      desc: json['desc'],
      ticketAnswerState: json['ticketAnswerState'],
      isSeen: json['isSeen'],
      createDate: json['createDate'],
      id: json['id'],
      isClient: json['isClient'],
    );
  }
}
