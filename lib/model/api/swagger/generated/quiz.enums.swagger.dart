import 'package:json_annotation/json_annotation.dart';

enum UsersRole {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(admin)
  admin(0),
  @JsonValue(user)
  user(1);

  final int? value;

  const UsersRole(this.value);
}

enum ContactUsState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(seen)
  seen(0),
  @JsonValue(unseen)
  unseen(1);

  final int? value;

  const ContactUsState(this.value);
}

enum ApiResultStatusCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(success)
  success(0),
  @JsonValue(servererror)
  servererror(1),
  @JsonValue(badrequest)
  badrequest(2),
  @JsonValue(notfound)
  notfound(3),
  @JsonValue(listempty)
  listempty(4),
  @JsonValue(logicerror)
  logicerror(5),
  @JsonValue(unauthorized)
  unauthorized(6),
  @JsonValue(phonenotconfirm)
  phonenotconfirm(7),
  @JsonValue(passwordnotfound)
  passwordnotfound(8),
  @JsonValue(registered)
  registered(9),
  @JsonValue(tokenisexpired)
  tokenisexpired(10);

  final int? value;

  const ApiResultStatusCode(this.value);
}

enum Priority {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(normal)
  normal(0),
  @JsonValue(immediate)
  immediate(1),
  @JsonValue(urgent)
  urgent(2);

  final int? value;

  const Priority(this.value);
}

enum TicketState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(onprogress)
  onprogress(0),
  @JsonValue(answerd)
  answerd(1),
  @JsonValue(closed)
  closed(2);

  final int? value;

  const TicketState(this.value);
}
