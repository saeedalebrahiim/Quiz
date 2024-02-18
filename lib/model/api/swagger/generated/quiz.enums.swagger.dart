import 'package:json_annotation/json_annotation.dart';

enum UsersRole {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(admin)
  admin(1),
  @JsonValue(user)
  user(2);

  final int? value;

  const UsersRole(this.value);
}

enum ContactUsState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(seen)
  seen(1),
  @JsonValue(unseen)
  unseen(2);

  final int? value;

  const ContactUsState(this.value);
}

enum ApiResultStatusCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(success)
  success(1),
  @JsonValue(servererror)
  servererror(2),
  @JsonValue(badrequest)
  badrequest(3),
  @JsonValue(notfound)
  notfound(4),
  @JsonValue(listempty)
  listempty(5),
  @JsonValue(logicerror)
  logicerror(6),
  @JsonValue(unauthorized)
  unauthorized(7),
  @JsonValue(phonenotconfirm)
  phonenotconfirm(8),
  @JsonValue(passwordnotfound)
  passwordnotfound(9),
  @JsonValue(registered)
  registered(10),
  @JsonValue(tokenisexpired)
  tokenisexpired(11);

  final int? value;

  const ApiResultStatusCode(this.value);
}

enum Priority {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(normal)
  normal(1),
  @JsonValue(immediate)
  immediate(2),
  @JsonValue(urgent)
  urgent(3);

  final int? value;

  const Priority(this.value);
}

enum TicketState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(onprogress)
  onprogress(1),
  @JsonValue(answerd)
  answerd(2),
  @JsonValue(closed)
  closed(3);

  final int? value;

  const TicketState(this.value);
}
