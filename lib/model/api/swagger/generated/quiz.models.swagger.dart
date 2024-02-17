// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'quiz.enums.swagger.dart' as enums;

part 'quiz.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthDto {
  const AuthDto({
    required this.userName,
    this.autoCode,
  });

  factory AuthDto.fromJson(Map<String, dynamic> json) =>
      _$AuthDtoFromJson(json);

  static const toJsonFactory = _$AuthDtoToJson;
  Map<String, dynamic> toJson() => _$AuthDtoToJson(this);

  @JsonKey(name: 'userName', includeIfNull: false)
  final String userName;
  @JsonKey(name: 'auto_code', includeIfNull: false)
  final String? autoCode;
  static const fromJsonFactory = _$AuthDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthDto &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.autoCode, autoCode) ||
                const DeepCollectionEquality()
                    .equals(other.autoCode, autoCode)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(autoCode) ^
      runtimeType.hashCode;
}

extension $AuthDtoExtension on AuthDto {
  AuthDto copyWith({String? userName, String? autoCode}) {
    return AuthDto(
        userName: userName ?? this.userName,
        autoCode: autoCode ?? this.autoCode);
  }

  AuthDto copyWithWrapped(
      {Wrapped<String>? userName, Wrapped<String?>? autoCode}) {
    return AuthDto(
        userName: (userName != null ? userName.value : this.userName),
        autoCode: (autoCode != null ? autoCode.value : this.autoCode));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthConfirmDto {
  const AuthConfirmDto({
    this.id,
    required this.userName,
    required this.verificationCode,
  });

  factory AuthConfirmDto.fromJson(Map<String, dynamic> json) =>
      _$AuthConfirmDtoFromJson(json);

  static const toJsonFactory = _$AuthConfirmDtoToJson;
  Map<String, dynamic> toJson() => _$AuthConfirmDtoToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'userName', includeIfNull: false)
  final String userName;
  @JsonKey(name: 'verificationCode', includeIfNull: false)
  final String verificationCode;
  static const fromJsonFactory = _$AuthConfirmDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthConfirmDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.verificationCode, verificationCode) ||
                const DeepCollectionEquality()
                    .equals(other.verificationCode, verificationCode)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(verificationCode) ^
      runtimeType.hashCode;
}

extension $AuthConfirmDtoExtension on AuthConfirmDto {
  AuthConfirmDto copyWith(
      {int? id, String? userName, String? verificationCode}) {
    return AuthConfirmDto(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        verificationCode: verificationCode ?? this.verificationCode);
  }

  AuthConfirmDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String>? userName,
      Wrapped<String>? verificationCode}) {
    return AuthConfirmDto(
        id: (id != null ? id.value : this.id),
        userName: (userName != null ? userName.value : this.userName),
        verificationCode: (verificationCode != null
            ? verificationCode.value
            : this.verificationCode));
  }
}

@JsonSerializable(explicitToJson: true)
class ContactusSelectDto {
  const ContactusSelectDto({
    this.fullName,
    this.phoneNumber,
    this.email,
    this.messageText,
    this.subjectText,
    this.contactUsState,
    required this.id,
    this.createDate,
  });

  factory ContactusSelectDto.fromJson(Map<String, dynamic> json) =>
      _$ContactusSelectDtoFromJson(json);

  static const toJsonFactory = _$ContactusSelectDtoToJson;
  Map<String, dynamic> toJson() => _$ContactusSelectDtoToJson(this);

  @JsonKey(name: 'fullName', includeIfNull: false)
  final String? fullName;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'messageText', includeIfNull: false)
  final String? messageText;
  @JsonKey(name: 'subjectText', includeIfNull: false)
  final String? subjectText;
  @JsonKey(
    name: 'contactUsState',
    includeIfNull: false,
    toJson: contactUsStateNullableToJson,
    fromJson: contactUsStateNullableFromJson,
  )
  final enums.ContactUsState? contactUsState;
  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'createDate', includeIfNull: false)
  final DateTime? createDate;
  static const fromJsonFactory = _$ContactusSelectDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContactusSelectDto &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.messageText, messageText) ||
                const DeepCollectionEquality()
                    .equals(other.messageText, messageText)) &&
            (identical(other.subjectText, subjectText) ||
                const DeepCollectionEquality()
                    .equals(other.subjectText, subjectText)) &&
            (identical(other.contactUsState, contactUsState) ||
                const DeepCollectionEquality()
                    .equals(other.contactUsState, contactUsState)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createDate, createDate) ||
                const DeepCollectionEquality()
                    .equals(other.createDate, createDate)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(messageText) ^
      const DeepCollectionEquality().hash(subjectText) ^
      const DeepCollectionEquality().hash(contactUsState) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createDate) ^
      runtimeType.hashCode;
}

extension $ContactusSelectDtoExtension on ContactusSelectDto {
  ContactusSelectDto copyWith(
      {String? fullName,
      String? phoneNumber,
      String? email,
      String? messageText,
      String? subjectText,
      enums.ContactUsState? contactUsState,
      int? id,
      DateTime? createDate}) {
    return ContactusSelectDto(
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        messageText: messageText ?? this.messageText,
        subjectText: subjectText ?? this.subjectText,
        contactUsState: contactUsState ?? this.contactUsState,
        id: id ?? this.id,
        createDate: createDate ?? this.createDate);
  }

  ContactusSelectDto copyWithWrapped(
      {Wrapped<String?>? fullName,
      Wrapped<String?>? phoneNumber,
      Wrapped<String?>? email,
      Wrapped<String?>? messageText,
      Wrapped<String?>? subjectText,
      Wrapped<enums.ContactUsState?>? contactUsState,
      Wrapped<int>? id,
      Wrapped<DateTime?>? createDate}) {
    return ContactusSelectDto(
        fullName: (fullName != null ? fullName.value : this.fullName),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        email: (email != null ? email.value : this.email),
        messageText:
            (messageText != null ? messageText.value : this.messageText),
        subjectText:
            (subjectText != null ? subjectText.value : this.subjectText),
        contactUsState: (contactUsState != null
            ? contactUsState.value
            : this.contactUsState),
        id: (id != null ? id.value : this.id),
        createDate: (createDate != null ? createDate.value : this.createDate));
  }
}

@JsonSerializable(explicitToJson: true)
class ContactusSelectDtoApiResult {
  const ContactusSelectDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory ContactusSelectDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$ContactusSelectDtoApiResultFromJson(json);

  static const toJsonFactory = _$ContactusSelectDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$ContactusSelectDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final ContactusSelectDto? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$ContactusSelectDtoApiResultFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContactusSelectDtoApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ContactusSelectDtoApiResultExtension on ContactusSelectDtoApiResult {
  ContactusSelectDtoApiResult copyWith(
      {ContactusSelectDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return ContactusSelectDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  ContactusSelectDtoApiResult copyWithWrapped(
      {Wrapped<ContactusSelectDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return ContactusSelectDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class FAQSelectDto {
  const FAQSelectDto({
    this.question,
    this.answer,
    required this.id,
    this.createDate,
  });

  factory FAQSelectDto.fromJson(Map<String, dynamic> json) =>
      _$FAQSelectDtoFromJson(json);

  static const toJsonFactory = _$FAQSelectDtoToJson;
  Map<String, dynamic> toJson() => _$FAQSelectDtoToJson(this);

  @JsonKey(name: 'question', includeIfNull: false)
  final String? question;
  @JsonKey(name: 'answer', includeIfNull: false)
  final String? answer;
  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'createDate', includeIfNull: false)
  final DateTime? createDate;
  static const fromJsonFactory = _$FAQSelectDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FAQSelectDto &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createDate, createDate) ||
                const DeepCollectionEquality()
                    .equals(other.createDate, createDate)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createDate) ^
      runtimeType.hashCode;
}

extension $FAQSelectDtoExtension on FAQSelectDto {
  FAQSelectDto copyWith(
      {String? question, String? answer, int? id, DateTime? createDate}) {
    return FAQSelectDto(
        question: question ?? this.question,
        answer: answer ?? this.answer,
        id: id ?? this.id,
        createDate: createDate ?? this.createDate);
  }

  FAQSelectDto copyWithWrapped(
      {Wrapped<String?>? question,
      Wrapped<String?>? answer,
      Wrapped<int>? id,
      Wrapped<DateTime?>? createDate}) {
    return FAQSelectDto(
        question: (question != null ? question.value : this.question),
        answer: (answer != null ? answer.value : this.answer),
        id: (id != null ? id.value : this.id),
        createDate: (createDate != null ? createDate.value : this.createDate));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiResult {
  const ApiResult({
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory ApiResult.fromJson(Map<String, dynamic> json) =>
      _$ApiResultFromJson(json);

  static const toJsonFactory = _$ApiResultToJson;
  Map<String, dynamic> toJson() => _$ApiResultToJson(this);

  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$ApiResultFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiResult &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ApiResultExtension on ApiResult {
  ApiResult copyWith(
      {bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return ApiResult(
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  ApiResult copyWithWrapped(
      {Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return ApiResult(
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class TicketSelectDto {
  const TicketSelectDto({
    this.subject,
    this.ticketState,
    this.priority,
    this.trackingCode,
    required this.id,
    this.createDate,
    this.desc,
    this.applicationUserFullName,
  });

  factory TicketSelectDto.fromJson(Map<String, dynamic> json) =>
      _$TicketSelectDtoFromJson(json);

  static const toJsonFactory = _$TicketSelectDtoToJson;
  Map<String, dynamic> toJson() => _$TicketSelectDtoToJson(this);

  @JsonKey(name: 'subject', includeIfNull: false)
  final String? subject;
  @JsonKey(
    name: 'ticketState',
    includeIfNull: false,
    toJson: ticketStateNullableToJson,
    fromJson: ticketStateNullableFromJson,
  )
  final enums.TicketState? ticketState;
  @JsonKey(
    name: 'priority',
    includeIfNull: false,
    toJson: priorityNullableToJson,
    fromJson: priorityNullableFromJson,
  )
  final enums.Priority? priority;
  @JsonKey(name: 'trackingCode', includeIfNull: false)
  final String? trackingCode;
  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'createDate', includeIfNull: false)
  final DateTime? createDate;
  @JsonKey(name: 'desc', includeIfNull: false)
  final String? desc;
  @JsonKey(name: 'applicationUserFullName', includeIfNull: false)
  final String? applicationUserFullName;
  static const fromJsonFactory = _$TicketSelectDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TicketSelectDto &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.ticketState, ticketState) ||
                const DeepCollectionEquality()
                    .equals(other.ticketState, ticketState)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)) &&
            (identical(other.trackingCode, trackingCode) ||
                const DeepCollectionEquality()
                    .equals(other.trackingCode, trackingCode)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createDate, createDate) ||
                const DeepCollectionEquality()
                    .equals(other.createDate, createDate)) &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)) &&
            (identical(
                    other.applicationUserFullName, applicationUserFullName) ||
                const DeepCollectionEquality().equals(
                    other.applicationUserFullName, applicationUserFullName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(ticketState) ^
      const DeepCollectionEquality().hash(priority) ^
      const DeepCollectionEquality().hash(trackingCode) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createDate) ^
      const DeepCollectionEquality().hash(desc) ^
      const DeepCollectionEquality().hash(applicationUserFullName) ^
      runtimeType.hashCode;
}

extension $TicketSelectDtoExtension on TicketSelectDto {
  TicketSelectDto copyWith(
      {String? subject,
      enums.TicketState? ticketState,
      enums.Priority? priority,
      String? trackingCode,
      int? id,
      DateTime? createDate,
      String? desc,
      String? applicationUserFullName}) {
    return TicketSelectDto(
        subject: subject ?? this.subject,
        ticketState: ticketState ?? this.ticketState,
        priority: priority ?? this.priority,
        trackingCode: trackingCode ?? this.trackingCode,
        id: id ?? this.id,
        createDate: createDate ?? this.createDate,
        desc: desc ?? this.desc,
        applicationUserFullName:
            applicationUserFullName ?? this.applicationUserFullName);
  }

  TicketSelectDto copyWithWrapped(
      {Wrapped<String?>? subject,
      Wrapped<enums.TicketState?>? ticketState,
      Wrapped<enums.Priority?>? priority,
      Wrapped<String?>? trackingCode,
      Wrapped<int>? id,
      Wrapped<DateTime?>? createDate,
      Wrapped<String?>? desc,
      Wrapped<String?>? applicationUserFullName}) {
    return TicketSelectDto(
        subject: (subject != null ? subject.value : this.subject),
        ticketState:
            (ticketState != null ? ticketState.value : this.ticketState),
        priority: (priority != null ? priority.value : this.priority),
        trackingCode:
            (trackingCode != null ? trackingCode.value : this.trackingCode),
        id: (id != null ? id.value : this.id),
        createDate: (createDate != null ? createDate.value : this.createDate),
        desc: (desc != null ? desc.value : this.desc),
        applicationUserFullName: (applicationUserFullName != null
            ? applicationUserFullName.value
            : this.applicationUserFullName));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdatePhoneNumberDto {
  const UpdatePhoneNumberDto({
    required this.phoneNumber,
    required this.verifyCode,
  });

  factory UpdatePhoneNumberDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePhoneNumberDtoFromJson(json);

  static const toJsonFactory = _$UpdatePhoneNumberDtoToJson;
  Map<String, dynamic> toJson() => _$UpdatePhoneNumberDtoToJson(this);

  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String phoneNumber;
  @JsonKey(name: 'verifyCode', includeIfNull: false)
  final String verifyCode;
  static const fromJsonFactory = _$UpdatePhoneNumberDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdatePhoneNumberDto &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.verifyCode, verifyCode) ||
                const DeepCollectionEquality()
                    .equals(other.verifyCode, verifyCode)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(verifyCode) ^
      runtimeType.hashCode;
}

extension $UpdatePhoneNumberDtoExtension on UpdatePhoneNumberDto {
  UpdatePhoneNumberDto copyWith({String? phoneNumber, String? verifyCode}) {
    return UpdatePhoneNumberDto(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        verifyCode: verifyCode ?? this.verifyCode);
  }

  UpdatePhoneNumberDto copyWithWrapped(
      {Wrapped<String>? phoneNumber, Wrapped<String>? verifyCode}) {
    return UpdatePhoneNumberDto(
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        verifyCode: (verifyCode != null ? verifyCode.value : this.verifyCode));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1AuthTokenPost$RequestBody {
  const ApiV1AuthTokenPost$RequestBody({
    this.grantType,
    this.username,
    this.password,
    this.userRole,
    this.refreshToken,
    this.scope,
    this.clientId,
    this.clientSecret,
  });

  factory ApiV1AuthTokenPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$ApiV1AuthTokenPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1AuthTokenPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$ApiV1AuthTokenPost$RequestBodyToJson(this);

  @JsonKey(name: 'grant_type', includeIfNull: false)
  final String? grantType;
  @JsonKey(name: 'username', includeIfNull: false)
  final String? username;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(
    name: 'UserRole',
    includeIfNull: false,
    toJson: usersRoleNullableToJson,
    fromJson: usersRoleNullableFromJson,
  )
  final enums.UsersRole? userRole;
  @JsonKey(name: 'refresh_token', includeIfNull: false)
  final String? refreshToken;
  @JsonKey(name: 'scope', includeIfNull: false)
  final String? scope;
  @JsonKey(name: 'client_id', includeIfNull: false)
  final String? clientId;
  @JsonKey(name: 'client_secret', includeIfNull: false)
  final String? clientSecret;
  static const fromJsonFactory = _$ApiV1AuthTokenPost$RequestBodyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiV1AuthTokenPost$RequestBody &&
            (identical(other.grantType, grantType) ||
                const DeepCollectionEquality()
                    .equals(other.grantType, grantType)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.userRole, userRole) ||
                const DeepCollectionEquality()
                    .equals(other.userRole, userRole)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.scope, scope) ||
                const DeepCollectionEquality().equals(other.scope, scope)) &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.clientSecret, clientSecret) ||
                const DeepCollectionEquality()
                    .equals(other.clientSecret, clientSecret)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(grantType) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(userRole) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(scope) ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(clientSecret) ^
      runtimeType.hashCode;
}

extension $ApiV1AuthTokenPost$RequestBodyExtension
    on ApiV1AuthTokenPost$RequestBody {
  ApiV1AuthTokenPost$RequestBody copyWith(
      {String? grantType,
      String? username,
      String? password,
      enums.UsersRole? userRole,
      String? refreshToken,
      String? scope,
      String? clientId,
      String? clientSecret}) {
    return ApiV1AuthTokenPost$RequestBody(
        grantType: grantType ?? this.grantType,
        username: username ?? this.username,
        password: password ?? this.password,
        userRole: userRole ?? this.userRole,
        refreshToken: refreshToken ?? this.refreshToken,
        scope: scope ?? this.scope,
        clientId: clientId ?? this.clientId,
        clientSecret: clientSecret ?? this.clientSecret);
  }

  ApiV1AuthTokenPost$RequestBody copyWithWrapped(
      {Wrapped<String?>? grantType,
      Wrapped<String?>? username,
      Wrapped<String?>? password,
      Wrapped<enums.UsersRole?>? userRole,
      Wrapped<String?>? refreshToken,
      Wrapped<String?>? scope,
      Wrapped<String?>? clientId,
      Wrapped<String?>? clientSecret}) {
    return ApiV1AuthTokenPost$RequestBody(
        grantType: (grantType != null ? grantType.value : this.grantType),
        username: (username != null ? username.value : this.username),
        password: (password != null ? password.value : this.password),
        userRole: (userRole != null ? userRole.value : this.userRole),
        refreshToken:
            (refreshToken != null ? refreshToken.value : this.refreshToken),
        scope: (scope != null ? scope.value : this.scope),
        clientId: (clientId != null ? clientId.value : this.clientId),
        clientSecret:
            (clientSecret != null ? clientSecret.value : this.clientSecret));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1AuthSelectPasswordPost$RequestBody {
  const ApiV1AuthSelectPasswordPost$RequestBody({
    required this.password,
    required this.confirmPassword,
  });

  factory ApiV1AuthSelectPasswordPost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ApiV1AuthSelectPasswordPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1AuthSelectPasswordPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1AuthSelectPasswordPost$RequestBodyToJson(this);

  @JsonKey(name: 'Password', includeIfNull: false)
  final String password;
  @JsonKey(name: 'ConfirmPassword', includeIfNull: false)
  final String confirmPassword;
  static const fromJsonFactory =
      _$ApiV1AuthSelectPasswordPost$RequestBodyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiV1AuthSelectPasswordPost$RequestBody &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.confirmPassword, confirmPassword) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPassword, confirmPassword)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(confirmPassword) ^
      runtimeType.hashCode;
}

extension $ApiV1AuthSelectPasswordPost$RequestBodyExtension
    on ApiV1AuthSelectPasswordPost$RequestBody {
  ApiV1AuthSelectPasswordPost$RequestBody copyWith(
      {String? password, String? confirmPassword}) {
    return ApiV1AuthSelectPasswordPost$RequestBody(
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword);
  }

  ApiV1AuthSelectPasswordPost$RequestBody copyWithWrapped(
      {Wrapped<String>? password, Wrapped<String>? confirmPassword}) {
    return ApiV1AuthSelectPasswordPost$RequestBody(
        password: (password != null ? password.value : this.password),
        confirmPassword: (confirmPassword != null
            ? confirmPassword.value
            : this.confirmPassword));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1AuthForgotPasswordPost$RequestBody {
  const ApiV1AuthForgotPasswordPost$RequestBody({
    required this.userName,
    this.autoCode,
  });

  factory ApiV1AuthForgotPasswordPost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ApiV1AuthForgotPasswordPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1AuthForgotPasswordPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1AuthForgotPasswordPost$RequestBodyToJson(this);

  @JsonKey(name: 'UserName', includeIfNull: false)
  final String userName;
  @JsonKey(name: 'auto_code', includeIfNull: false)
  final String? autoCode;
  static const fromJsonFactory =
      _$ApiV1AuthForgotPasswordPost$RequestBodyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiV1AuthForgotPasswordPost$RequestBody &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.autoCode, autoCode) ||
                const DeepCollectionEquality()
                    .equals(other.autoCode, autoCode)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(autoCode) ^
      runtimeType.hashCode;
}

extension $ApiV1AuthForgotPasswordPost$RequestBodyExtension
    on ApiV1AuthForgotPasswordPost$RequestBody {
  ApiV1AuthForgotPasswordPost$RequestBody copyWith(
      {String? userName, String? autoCode}) {
    return ApiV1AuthForgotPasswordPost$RequestBody(
        userName: userName ?? this.userName,
        autoCode: autoCode ?? this.autoCode);
  }

  ApiV1AuthForgotPasswordPost$RequestBody copyWithWrapped(
      {Wrapped<String>? userName, Wrapped<String?>? autoCode}) {
    return ApiV1AuthForgotPasswordPost$RequestBody(
        userName: (userName != null ? userName.value : this.userName),
        autoCode: (autoCode != null ? autoCode.value : this.autoCode));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1AuthChangePasswordPost$RequestBody {
  const ApiV1AuthChangePasswordPost$RequestBody({
    required this.userName,
    required this.verificationCode,
    required this.password,
    required this.confirmPassword,
  });

  factory ApiV1AuthChangePasswordPost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ApiV1AuthChangePasswordPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1AuthChangePasswordPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1AuthChangePasswordPost$RequestBodyToJson(this);

  @JsonKey(name: 'UserName', includeIfNull: false)
  final String userName;
  @JsonKey(name: 'VerificationCode', includeIfNull: false)
  final String verificationCode;
  @JsonKey(name: 'Password', includeIfNull: false)
  final String password;
  @JsonKey(name: 'ConfirmPassword', includeIfNull: false)
  final String confirmPassword;
  static const fromJsonFactory =
      _$ApiV1AuthChangePasswordPost$RequestBodyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiV1AuthChangePasswordPost$RequestBody &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.verificationCode, verificationCode) ||
                const DeepCollectionEquality()
                    .equals(other.verificationCode, verificationCode)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.confirmPassword, confirmPassword) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPassword, confirmPassword)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(verificationCode) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(confirmPassword) ^
      runtimeType.hashCode;
}

extension $ApiV1AuthChangePasswordPost$RequestBodyExtension
    on ApiV1AuthChangePasswordPost$RequestBody {
  ApiV1AuthChangePasswordPost$RequestBody copyWith(
      {String? userName,
      String? verificationCode,
      String? password,
      String? confirmPassword}) {
    return ApiV1AuthChangePasswordPost$RequestBody(
        userName: userName ?? this.userName,
        verificationCode: verificationCode ?? this.verificationCode,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword);
  }

  ApiV1AuthChangePasswordPost$RequestBody copyWithWrapped(
      {Wrapped<String>? userName,
      Wrapped<String>? verificationCode,
      Wrapped<String>? password,
      Wrapped<String>? confirmPassword}) {
    return ApiV1AuthChangePasswordPost$RequestBody(
        userName: (userName != null ? userName.value : this.userName),
        verificationCode: (verificationCode != null
            ? verificationCode.value
            : this.verificationCode),
        password: (password != null ? password.value : this.password),
        confirmPassword: (confirmPassword != null
            ? confirmPassword.value
            : this.confirmPassword));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1ContactUsPost$RequestBody {
  const ApiV1ContactUsPost$RequestBody({
    required this.fullName,
    this.phoneNumber,
    this.email,
    required this.messageText,
    this.subjectText,
    required this.id,
  });

  factory ApiV1ContactUsPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$ApiV1ContactUsPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1ContactUsPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$ApiV1ContactUsPost$RequestBodyToJson(this);

  @JsonKey(name: 'FullName', includeIfNull: false)
  final String fullName;
  @JsonKey(name: 'PhoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'Email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'MessageText', includeIfNull: false)
  final String messageText;
  @JsonKey(name: 'SubjectText', includeIfNull: false)
  final String? subjectText;
  @JsonKey(name: 'Id', includeIfNull: false)
  final int id;
  static const fromJsonFactory = _$ApiV1ContactUsPost$RequestBodyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiV1ContactUsPost$RequestBody &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.messageText, messageText) ||
                const DeepCollectionEquality()
                    .equals(other.messageText, messageText)) &&
            (identical(other.subjectText, subjectText) ||
                const DeepCollectionEquality()
                    .equals(other.subjectText, subjectText)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(messageText) ^
      const DeepCollectionEquality().hash(subjectText) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $ApiV1ContactUsPost$RequestBodyExtension
    on ApiV1ContactUsPost$RequestBody {
  ApiV1ContactUsPost$RequestBody copyWith(
      {String? fullName,
      String? phoneNumber,
      String? email,
      String? messageText,
      String? subjectText,
      int? id}) {
    return ApiV1ContactUsPost$RequestBody(
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        messageText: messageText ?? this.messageText,
        subjectText: subjectText ?? this.subjectText,
        id: id ?? this.id);
  }

  ApiV1ContactUsPost$RequestBody copyWithWrapped(
      {Wrapped<String>? fullName,
      Wrapped<String?>? phoneNumber,
      Wrapped<String?>? email,
      Wrapped<String>? messageText,
      Wrapped<String?>? subjectText,
      Wrapped<int>? id}) {
    return ApiV1ContactUsPost$RequestBody(
        fullName: (fullName != null ? fullName.value : this.fullName),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        email: (email != null ? email.value : this.email),
        messageText:
            (messageText != null ? messageText.value : this.messageText),
        subjectText:
            (subjectText != null ? subjectText.value : this.subjectText),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1TicketTestUserwPost$RequestBody {
  const ApiV1TicketTestUserwPost$RequestBody({
    this.subject,
    this.priority,
    required this.id,
    required this.desc,
  });

  factory ApiV1TicketTestUserwPost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ApiV1TicketTestUserwPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1TicketTestUserwPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1TicketTestUserwPost$RequestBodyToJson(this);

  @JsonKey(name: 'Subject', includeIfNull: false)
  final String? subject;
  @JsonKey(
    name: 'Priority',
    includeIfNull: false,
    toJson: priorityNullableToJson,
    fromJson: priorityNullableFromJson,
  )
  final enums.Priority? priority;
  @JsonKey(name: 'Id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'Desc', includeIfNull: false)
  final String desc;
  static const fromJsonFactory = _$ApiV1TicketTestUserwPost$RequestBodyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiV1TicketTestUserwPost$RequestBody &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(priority) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(desc) ^
      runtimeType.hashCode;
}

extension $ApiV1TicketTestUserwPost$RequestBodyExtension
    on ApiV1TicketTestUserwPost$RequestBody {
  ApiV1TicketTestUserwPost$RequestBody copyWith(
      {String? subject, enums.Priority? priority, int? id, String? desc}) {
    return ApiV1TicketTestUserwPost$RequestBody(
        subject: subject ?? this.subject,
        priority: priority ?? this.priority,
        id: id ?? this.id,
        desc: desc ?? this.desc);
  }

  ApiV1TicketTestUserwPost$RequestBody copyWithWrapped(
      {Wrapped<String?>? subject,
      Wrapped<enums.Priority?>? priority,
      Wrapped<int>? id,
      Wrapped<String>? desc}) {
    return ApiV1TicketTestUserwPost$RequestBody(
        subject: (subject != null ? subject.value : this.subject),
        priority: (priority != null ? priority.value : this.priority),
        id: (id != null ? id.value : this.id),
        desc: (desc != null ? desc.value : this.desc));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1TicketCreateTicketByUserPost$RequestBody {
  const ApiV1TicketCreateTicketByUserPost$RequestBody({
    this.subject,
    this.priority,
    required this.id,
    required this.desc,
  });

  factory ApiV1TicketCreateTicketByUserPost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ApiV1TicketCreateTicketByUserPost$RequestBodyFromJson(json);

  static const toJsonFactory =
      _$ApiV1TicketCreateTicketByUserPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1TicketCreateTicketByUserPost$RequestBodyToJson(this);

  @JsonKey(name: 'Subject', includeIfNull: false)
  final String? subject;
  @JsonKey(
    name: 'Priority',
    includeIfNull: false,
    toJson: priorityNullableToJson,
    fromJson: priorityNullableFromJson,
  )
  final enums.Priority? priority;
  @JsonKey(name: 'Id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'Desc', includeIfNull: false)
  final String desc;
  static const fromJsonFactory =
      _$ApiV1TicketCreateTicketByUserPost$RequestBodyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiV1TicketCreateTicketByUserPost$RequestBody &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(priority) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(desc) ^
      runtimeType.hashCode;
}

extension $ApiV1TicketCreateTicketByUserPost$RequestBodyExtension
    on ApiV1TicketCreateTicketByUserPost$RequestBody {
  ApiV1TicketCreateTicketByUserPost$RequestBody copyWith(
      {String? subject, enums.Priority? priority, int? id, String? desc}) {
    return ApiV1TicketCreateTicketByUserPost$RequestBody(
        subject: subject ?? this.subject,
        priority: priority ?? this.priority,
        id: id ?? this.id,
        desc: desc ?? this.desc);
  }

  ApiV1TicketCreateTicketByUserPost$RequestBody copyWithWrapped(
      {Wrapped<String?>? subject,
      Wrapped<enums.Priority?>? priority,
      Wrapped<int>? id,
      Wrapped<String>? desc}) {
    return ApiV1TicketCreateTicketByUserPost$RequestBody(
        subject: (subject != null ? subject.value : this.subject),
        priority: (priority != null ? priority.value : this.priority),
        id: (id != null ? id.value : this.id),
        desc: (desc != null ? desc.value : this.desc));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1TicketAddTicketAnswerByUserPost$RequestBody {
  const ApiV1TicketAddTicketAnswerByUserPost$RequestBody({
    required this.desc,
    required this.id,
  });

  factory ApiV1TicketAddTicketAnswerByUserPost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ApiV1TicketAddTicketAnswerByUserPost$RequestBodyFromJson(json);

  static const toJsonFactory =
      _$ApiV1TicketAddTicketAnswerByUserPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1TicketAddTicketAnswerByUserPost$RequestBodyToJson(this);

  @JsonKey(name: 'Desc', includeIfNull: false)
  final String desc;
  @JsonKey(name: 'Id', includeIfNull: false)
  final int id;
  static const fromJsonFactory =
      _$ApiV1TicketAddTicketAnswerByUserPost$RequestBodyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiV1TicketAddTicketAnswerByUserPost$RequestBody &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(desc) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $ApiV1TicketAddTicketAnswerByUserPost$RequestBodyExtension
    on ApiV1TicketAddTicketAnswerByUserPost$RequestBody {
  ApiV1TicketAddTicketAnswerByUserPost$RequestBody copyWith(
      {String? desc, int? id}) {
    return ApiV1TicketAddTicketAnswerByUserPost$RequestBody(
        desc: desc ?? this.desc, id: id ?? this.id);
  }

  ApiV1TicketAddTicketAnswerByUserPost$RequestBody copyWithWrapped(
      {Wrapped<String>? desc, Wrapped<int>? id}) {
    return ApiV1TicketAddTicketAnswerByUserPost$RequestBody(
        desc: (desc != null ? desc.value : this.desc),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1UserManagerEditProfilePost$RequestBody {
  const ApiV1UserManagerEditProfilePost$RequestBody({
    required this.fullName,
    this.file,
    this.education,
    this.bankId,
    this.iban,
  });

  factory ApiV1UserManagerEditProfilePost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ApiV1UserManagerEditProfilePost$RequestBodyFromJson(json);

  static const toJsonFactory =
      _$ApiV1UserManagerEditProfilePost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1UserManagerEditProfilePost$RequestBodyToJson(this);

  @JsonKey(name: 'FullName', includeIfNull: false)
  final String fullName;
  @JsonKey(name: 'file', includeIfNull: false)
  final String? file;
  @JsonKey(name: 'Education', includeIfNull: false)
  final String? education;
  @JsonKey(name: 'BankId', includeIfNull: false)
  final int? bankId;
  @JsonKey(name: 'IBAN', includeIfNull: false)
  final String? iban;
  static const fromJsonFactory =
      _$ApiV1UserManagerEditProfilePost$RequestBodyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiV1UserManagerEditProfilePost$RequestBody &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)) &&
            (identical(other.education, education) ||
                const DeepCollectionEquality()
                    .equals(other.education, education)) &&
            (identical(other.bankId, bankId) ||
                const DeepCollectionEquality().equals(other.bankId, bankId)) &&
            (identical(other.iban, iban) ||
                const DeepCollectionEquality().equals(other.iban, iban)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(file) ^
      const DeepCollectionEquality().hash(education) ^
      const DeepCollectionEquality().hash(bankId) ^
      const DeepCollectionEquality().hash(iban) ^
      runtimeType.hashCode;
}

extension $ApiV1UserManagerEditProfilePost$RequestBodyExtension
    on ApiV1UserManagerEditProfilePost$RequestBody {
  ApiV1UserManagerEditProfilePost$RequestBody copyWith(
      {String? fullName,
      String? file,
      String? education,
      int? bankId,
      String? iban}) {
    return ApiV1UserManagerEditProfilePost$RequestBody(
        fullName: fullName ?? this.fullName,
        file: file ?? this.file,
        education: education ?? this.education,
        bankId: bankId ?? this.bankId,
        iban: iban ?? this.iban);
  }

  ApiV1UserManagerEditProfilePost$RequestBody copyWithWrapped(
      {Wrapped<String>? fullName,
      Wrapped<String?>? file,
      Wrapped<String?>? education,
      Wrapped<int?>? bankId,
      Wrapped<String?>? iban}) {
    return ApiV1UserManagerEditProfilePost$RequestBody(
        fullName: (fullName != null ? fullName.value : this.fullName),
        file: (file != null ? file.value : this.file),
        education: (education != null ? education.value : this.education),
        bankId: (bankId != null ? bankId.value : this.bankId),
        iban: (iban != null ? iban.value : this.iban));
  }
}

int? usersRoleNullableToJson(enums.UsersRole? usersRole) {
  return usersRole?.value;
}

int? usersRoleToJson(enums.UsersRole usersRole) {
  return usersRole.value;
}

enums.UsersRole usersRoleFromJson(
  Object? usersRole, [
  enums.UsersRole? defaultValue,
]) {
  return enums.UsersRole.values.firstWhereOrNull((e) => e.value == usersRole) ??
      defaultValue ??
      enums.UsersRole.swaggerGeneratedUnknown;
}

enums.UsersRole? usersRoleNullableFromJson(
  Object? usersRole, [
  enums.UsersRole? defaultValue,
]) {
  if (usersRole == null) {
    return null;
  }
  return enums.UsersRole.values.firstWhereOrNull((e) => e.value == usersRole) ??
      defaultValue;
}

String usersRoleExplodedListToJson(List<enums.UsersRole>? usersRole) {
  return usersRole?.map((e) => e.value!).join(',') ?? '';
}

List<int> usersRoleListToJson(List<enums.UsersRole>? usersRole) {
  if (usersRole == null) {
    return [];
  }

  return usersRole.map((e) => e.value!).toList();
}

List<enums.UsersRole> usersRoleListFromJson(
  List? usersRole, [
  List<enums.UsersRole>? defaultValue,
]) {
  if (usersRole == null) {
    return defaultValue ?? [];
  }

  return usersRole.map((e) => usersRoleFromJson(e.toString())).toList();
}

List<enums.UsersRole>? usersRoleNullableListFromJson(
  List? usersRole, [
  List<enums.UsersRole>? defaultValue,
]) {
  if (usersRole == null) {
    return defaultValue;
  }

  return usersRole.map((e) => usersRoleFromJson(e.toString())).toList();
}

int? contactUsStateNullableToJson(enums.ContactUsState? contactUsState) {
  return contactUsState?.value;
}

int? contactUsStateToJson(enums.ContactUsState contactUsState) {
  return contactUsState.value;
}

enums.ContactUsState contactUsStateFromJson(
  Object? contactUsState, [
  enums.ContactUsState? defaultValue,
]) {
  return enums.ContactUsState.values
          .firstWhereOrNull((e) => e.value == contactUsState) ??
      defaultValue ??
      enums.ContactUsState.swaggerGeneratedUnknown;
}

enums.ContactUsState? contactUsStateNullableFromJson(
  Object? contactUsState, [
  enums.ContactUsState? defaultValue,
]) {
  if (contactUsState == null) {
    return null;
  }
  return enums.ContactUsState.values
          .firstWhereOrNull((e) => e.value == contactUsState) ??
      defaultValue;
}

String contactUsStateExplodedListToJson(
    List<enums.ContactUsState>? contactUsState) {
  return contactUsState?.map((e) => e.value!).join(',') ?? '';
}

List<int> contactUsStateListToJson(List<enums.ContactUsState>? contactUsState) {
  if (contactUsState == null) {
    return [];
  }

  return contactUsState.map((e) => e.value!).toList();
}

List<enums.ContactUsState> contactUsStateListFromJson(
  List? contactUsState, [
  List<enums.ContactUsState>? defaultValue,
]) {
  if (contactUsState == null) {
    return defaultValue ?? [];
  }

  return contactUsState
      .map((e) => contactUsStateFromJson(e.toString()))
      .toList();
}

List<enums.ContactUsState>? contactUsStateNullableListFromJson(
  List? contactUsState, [
  List<enums.ContactUsState>? defaultValue,
]) {
  if (contactUsState == null) {
    return defaultValue;
  }

  return contactUsState
      .map((e) => contactUsStateFromJson(e.toString()))
      .toList();
}

int? apiResultStatusCodeNullableToJson(
    enums.ApiResultStatusCode? apiResultStatusCode) {
  return apiResultStatusCode?.value;
}

int? apiResultStatusCodeToJson(enums.ApiResultStatusCode apiResultStatusCode) {
  return apiResultStatusCode.value;
}

enums.ApiResultStatusCode apiResultStatusCodeFromJson(
  Object? apiResultStatusCode, [
  enums.ApiResultStatusCode? defaultValue,
]) {
  return enums.ApiResultStatusCode.values
          .firstWhereOrNull((e) => e.value == apiResultStatusCode) ??
      defaultValue ??
      enums.ApiResultStatusCode.swaggerGeneratedUnknown;
}

enums.ApiResultStatusCode? apiResultStatusCodeNullableFromJson(
  Object? apiResultStatusCode, [
  enums.ApiResultStatusCode? defaultValue,
]) {
  if (apiResultStatusCode == null) {
    return null;
  }
  return enums.ApiResultStatusCode.values
          .firstWhereOrNull((e) => e.value == apiResultStatusCode) ??
      defaultValue;
}

String apiResultStatusCodeExplodedListToJson(
    List<enums.ApiResultStatusCode>? apiResultStatusCode) {
  return apiResultStatusCode?.map((e) => e.value!).join(',') ?? '';
}

List<int> apiResultStatusCodeListToJson(
    List<enums.ApiResultStatusCode>? apiResultStatusCode) {
  if (apiResultStatusCode == null) {
    return [];
  }

  return apiResultStatusCode.map((e) => e.value!).toList();
}

List<enums.ApiResultStatusCode> apiResultStatusCodeListFromJson(
  List? apiResultStatusCode, [
  List<enums.ApiResultStatusCode>? defaultValue,
]) {
  if (apiResultStatusCode == null) {
    return defaultValue ?? [];
  }

  return apiResultStatusCode
      .map((e) => apiResultStatusCodeFromJson(e.toString()))
      .toList();
}

List<enums.ApiResultStatusCode>? apiResultStatusCodeNullableListFromJson(
  List? apiResultStatusCode, [
  List<enums.ApiResultStatusCode>? defaultValue,
]) {
  if (apiResultStatusCode == null) {
    return defaultValue;
  }

  return apiResultStatusCode
      .map((e) => apiResultStatusCodeFromJson(e.toString()))
      .toList();
}

int? priorityNullableToJson(enums.Priority? priority) {
  return priority?.value;
}

int? priorityToJson(enums.Priority priority) {
  return priority.value;
}

enums.Priority priorityFromJson(
  Object? priority, [
  enums.Priority? defaultValue,
]) {
  return enums.Priority.values.firstWhereOrNull((e) => e.value == priority) ??
      defaultValue ??
      enums.Priority.swaggerGeneratedUnknown;
}

enums.Priority? priorityNullableFromJson(
  Object? priority, [
  enums.Priority? defaultValue,
]) {
  if (priority == null) {
    return null;
  }
  return enums.Priority.values.firstWhereOrNull((e) => e.value == priority) ??
      defaultValue;
}

String priorityExplodedListToJson(List<enums.Priority>? priority) {
  return priority?.map((e) => e.value!).join(',') ?? '';
}

List<int> priorityListToJson(List<enums.Priority>? priority) {
  if (priority == null) {
    return [];
  }

  return priority.map((e) => e.value!).toList();
}

List<enums.Priority> priorityListFromJson(
  List? priority, [
  List<enums.Priority>? defaultValue,
]) {
  if (priority == null) {
    return defaultValue ?? [];
  }

  return priority.map((e) => priorityFromJson(e.toString())).toList();
}

List<enums.Priority>? priorityNullableListFromJson(
  List? priority, [
  List<enums.Priority>? defaultValue,
]) {
  if (priority == null) {
    return defaultValue;
  }

  return priority.map((e) => priorityFromJson(e.toString())).toList();
}

int? ticketStateNullableToJson(enums.TicketState? ticketState) {
  return ticketState?.value;
}

int? ticketStateToJson(enums.TicketState ticketState) {
  return ticketState.value;
}

enums.TicketState ticketStateFromJson(
  Object? ticketState, [
  enums.TicketState? defaultValue,
]) {
  return enums.TicketState.values
          .firstWhereOrNull((e) => e.value == ticketState) ??
      defaultValue ??
      enums.TicketState.swaggerGeneratedUnknown;
}

enums.TicketState? ticketStateNullableFromJson(
  Object? ticketState, [
  enums.TicketState? defaultValue,
]) {
  if (ticketState == null) {
    return null;
  }
  return enums.TicketState.values
          .firstWhereOrNull((e) => e.value == ticketState) ??
      defaultValue;
}

String ticketStateExplodedListToJson(List<enums.TicketState>? ticketState) {
  return ticketState?.map((e) => e.value!).join(',') ?? '';
}

List<int> ticketStateListToJson(List<enums.TicketState>? ticketState) {
  if (ticketState == null) {
    return [];
  }

  return ticketState.map((e) => e.value!).toList();
}

List<enums.TicketState> ticketStateListFromJson(
  List? ticketState, [
  List<enums.TicketState>? defaultValue,
]) {
  if (ticketState == null) {
    return defaultValue ?? [];
  }

  return ticketState.map((e) => ticketStateFromJson(e.toString())).toList();
}

List<enums.TicketState>? ticketStateNullableListFromJson(
  List? ticketState, [
  List<enums.TicketState>? defaultValue,
]) {
  if (ticketState == null) {
    return defaultValue;
  }

  return ticketState.map((e) => ticketStateFromJson(e.toString())).toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
