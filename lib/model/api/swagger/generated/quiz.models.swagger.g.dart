// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDto _$AuthDtoFromJson(Map<String, dynamic> json) => AuthDto(
      userName: json['userName'] as String,
      autoCode: json['auto_code'] as String?,
    );

Map<String, dynamic> _$AuthDtoToJson(AuthDto instance) {
  final val = <String, dynamic>{
    'userName': instance.userName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('auto_code', instance.autoCode);
  return val;
}

AuthConfirmDto _$AuthConfirmDtoFromJson(Map<String, dynamic> json) =>
    AuthConfirmDto(
      id: json['id'] as int?,
      userName: json['userName'] as String,
      verificationCode: json['verificationCode'] as String,
    );

Map<String, dynamic> _$AuthConfirmDtoToJson(AuthConfirmDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['userName'] = instance.userName;
  val['verificationCode'] = instance.verificationCode;
  return val;
}

ContactusSelectDto _$ContactusSelectDtoFromJson(Map<String, dynamic> json) =>
    ContactusSelectDto(
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      messageText: json['messageText'] as String?,
      subjectText: json['subjectText'] as String?,
      contactUsState: contactUsStateNullableFromJson(json['contactUsState']),
      id: json['id'] as int,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
    );

Map<String, dynamic> _$ContactusSelectDtoToJson(ContactusSelectDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fullName', instance.fullName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('email', instance.email);
  writeNotNull('messageText', instance.messageText);
  writeNotNull('subjectText', instance.subjectText);
  writeNotNull(
      'contactUsState', contactUsStateNullableToJson(instance.contactUsState));
  val['id'] = instance.id;
  writeNotNull('createDate', instance.createDate?.toIso8601String());
  return val;
}

ContactusSelectDtoApiResult _$ContactusSelectDtoApiResultFromJson(
        Map<String, dynamic> json) =>
    ContactusSelectDtoApiResult(
      data: json['data'] == null
          ? null
          : ContactusSelectDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ContactusSelectDtoApiResultToJson(
    ContactusSelectDtoApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull(
      'statusCode', apiResultStatusCodeNullableToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

FAQSelectDto _$FAQSelectDtoFromJson(Map<String, dynamic> json) => FAQSelectDto(
      question: json['question'] as String?,
      answer: json['answer'] as String?,
      id: json['id'] as int,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
    );

Map<String, dynamic> _$FAQSelectDtoToJson(FAQSelectDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('question', instance.question);
  writeNotNull('answer', instance.answer);
  val['id'] = instance.id;
  writeNotNull('createDate', instance.createDate?.toIso8601String());
  return val;
}

ApiResult _$ApiResultFromJson(Map<String, dynamic> json) => ApiResult(
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ApiResultToJson(ApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull(
      'statusCode', apiResultStatusCodeNullableToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

TicketSelectDto _$TicketSelectDtoFromJson(Map<String, dynamic> json) =>
    TicketSelectDto(
      subject: json['subject'] as String?,
      ticketState: ticketStateNullableFromJson(json['ticketState']),
      priority: priorityNullableFromJson(json['priority']),
      trackingCode: json['trackingCode'] as String?,
      id: json['id'] as int,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      desc: json['desc'] as String?,
      applicationUserFullName: json['applicationUserFullName'] as String?,
    );

Map<String, dynamic> _$TicketSelectDtoToJson(TicketSelectDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subject', instance.subject);
  writeNotNull('ticketState', ticketStateNullableToJson(instance.ticketState));
  writeNotNull('priority', priorityNullableToJson(instance.priority));
  writeNotNull('trackingCode', instance.trackingCode);
  val['id'] = instance.id;
  writeNotNull('createDate', instance.createDate?.toIso8601String());
  writeNotNull('desc', instance.desc);
  writeNotNull('applicationUserFullName', instance.applicationUserFullName);
  return val;
}

UpdatePhoneNumberDto _$UpdatePhoneNumberDtoFromJson(
        Map<String, dynamic> json) =>
    UpdatePhoneNumberDto(
      phoneNumber: json['phoneNumber'] as String,
      verifyCode: json['verifyCode'] as String,
    );

Map<String, dynamic> _$UpdatePhoneNumberDtoToJson(
        UpdatePhoneNumberDto instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'verifyCode': instance.verifyCode,
    };

VerifyPaymentClass _$VerifyPaymentClassFromJson(Map<String, dynamic> json) =>
    VerifyPaymentClass(
      subscriptionId: json['subscriptionId'] as String?,
      token: json['token'] as String?,
      countOfGems: json['countOfGems'] as int?,
    );

Map<String, dynamic> _$VerifyPaymentClassToJson(VerifyPaymentClass instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subscriptionId', instance.subscriptionId);
  writeNotNull('token', instance.token);
  writeNotNull('countOfGems', instance.countOfGems);
  return val;
}

ApiV1AuthTokenPost$RequestBody _$ApiV1AuthTokenPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    ApiV1AuthTokenPost$RequestBody(
      grantType: json['grant_type'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      userRole: usersRoleNullableFromJson(json['UserRole']),
      refreshToken: json['refresh_token'] as String?,
      scope: json['scope'] as String?,
      clientId: json['client_id'] as String?,
      clientSecret: json['client_secret'] as String?,
    );

Map<String, dynamic> _$ApiV1AuthTokenPost$RequestBodyToJson(
    ApiV1AuthTokenPost$RequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grant_type', instance.grantType);
  writeNotNull('username', instance.username);
  writeNotNull('password', instance.password);
  writeNotNull('UserRole', usersRoleNullableToJson(instance.userRole));
  writeNotNull('refresh_token', instance.refreshToken);
  writeNotNull('scope', instance.scope);
  writeNotNull('client_id', instance.clientId);
  writeNotNull('client_secret', instance.clientSecret);
  return val;
}

ApiV1AuthSelectPasswordPost$RequestBody
    _$ApiV1AuthSelectPasswordPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1AuthSelectPasswordPost$RequestBody(
          password: json['Password'] as String,
          confirmPassword: json['ConfirmPassword'] as String,
        );

Map<String, dynamic> _$ApiV1AuthSelectPasswordPost$RequestBodyToJson(
        ApiV1AuthSelectPasswordPost$RequestBody instance) =>
    <String, dynamic>{
      'Password': instance.password,
      'ConfirmPassword': instance.confirmPassword,
    };

ApiV1AuthForgotPasswordPost$RequestBody
    _$ApiV1AuthForgotPasswordPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1AuthForgotPasswordPost$RequestBody(
          userName: json['UserName'] as String,
          autoCode: json['auto_code'] as String?,
        );

Map<String, dynamic> _$ApiV1AuthForgotPasswordPost$RequestBodyToJson(
    ApiV1AuthForgotPasswordPost$RequestBody instance) {
  final val = <String, dynamic>{
    'UserName': instance.userName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('auto_code', instance.autoCode);
  return val;
}

ApiV1AuthChangePasswordPost$RequestBody
    _$ApiV1AuthChangePasswordPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1AuthChangePasswordPost$RequestBody(
          userName: json['UserName'] as String,
          verificationCode: json['VerificationCode'] as String,
          password: json['Password'] as String,
          confirmPassword: json['ConfirmPassword'] as String,
        );

Map<String, dynamic> _$ApiV1AuthChangePasswordPost$RequestBodyToJson(
        ApiV1AuthChangePasswordPost$RequestBody instance) =>
    <String, dynamic>{
      'UserName': instance.userName,
      'VerificationCode': instance.verificationCode,
      'Password': instance.password,
      'ConfirmPassword': instance.confirmPassword,
    };

ApiV1ContactUsPost$RequestBody _$ApiV1ContactUsPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    ApiV1ContactUsPost$RequestBody(
      fullName: json['FullName'] as String,
      phoneNumber: json['PhoneNumber'] as String?,
      email: json['Email'] as String?,
      messageText: json['MessageText'] as String,
      subjectText: json['SubjectText'] as String?,
      id: json['Id'] as int,
    );

Map<String, dynamic> _$ApiV1ContactUsPost$RequestBodyToJson(
    ApiV1ContactUsPost$RequestBody instance) {
  final val = <String, dynamic>{
    'FullName': instance.fullName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PhoneNumber', instance.phoneNumber);
  writeNotNull('Email', instance.email);
  val['MessageText'] = instance.messageText;
  writeNotNull('SubjectText', instance.subjectText);
  val['Id'] = instance.id;
  return val;
}

ApiV1TicketTestUserwPost$RequestBody
    _$ApiV1TicketTestUserwPost$RequestBodyFromJson(Map<String, dynamic> json) =>
        ApiV1TicketTestUserwPost$RequestBody(
          subject: json['Subject'] as String?,
          priority: priorityNullableFromJson(json['Priority']),
          id: json['Id'] as int,
          desc: json['Desc'] as String,
        );

Map<String, dynamic> _$ApiV1TicketTestUserwPost$RequestBodyToJson(
    ApiV1TicketTestUserwPost$RequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Subject', instance.subject);
  writeNotNull('Priority', priorityNullableToJson(instance.priority));
  val['Id'] = instance.id;
  val['Desc'] = instance.desc;
  return val;
}

ApiV1TicketCreateTicketByUserPost$RequestBody
    _$ApiV1TicketCreateTicketByUserPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1TicketCreateTicketByUserPost$RequestBody(
          subject: json['Subject'] as String?,
          priority: priorityNullableFromJson(json['Priority']),
          id: json['Id'] as int,
          desc: json['Desc'] as String,
        );

Map<String, dynamic> _$ApiV1TicketCreateTicketByUserPost$RequestBodyToJson(
    ApiV1TicketCreateTicketByUserPost$RequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Subject', instance.subject);
  writeNotNull('Priority', priorityNullableToJson(instance.priority));
  val['Id'] = instance.id;
  val['Desc'] = instance.desc;
  return val;
}

ApiV1TicketAddTicketAnswerByUserPost$RequestBody
    _$ApiV1TicketAddTicketAnswerByUserPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1TicketAddTicketAnswerByUserPost$RequestBody(
          desc: json['Desc'] as String,
          id: json['Id'] as int,
        );

Map<String, dynamic> _$ApiV1TicketAddTicketAnswerByUserPost$RequestBodyToJson(
        ApiV1TicketAddTicketAnswerByUserPost$RequestBody instance) =>
    <String, dynamic>{
      'Desc': instance.desc,
      'Id': instance.id,
    };

ApiV1UserManagerEditProfilePost$RequestBody
    _$ApiV1UserManagerEditProfilePost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1UserManagerEditProfilePost$RequestBody(
          fullName: json['FullName'] as String,
          file: json['file'] as String?,
          education: json['Education'] as String?,
          bankId: json['BankId'] as int?,
          iban: json['IBAN'] as String?,
        );

Map<String, dynamic> _$ApiV1UserManagerEditProfilePost$RequestBodyToJson(
    ApiV1UserManagerEditProfilePost$RequestBody instance) {
  final val = <String, dynamic>{
    'FullName': instance.fullName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file', instance.file);
  writeNotNull('Education', instance.education);
  writeNotNull('BankId', instance.bankId);
  writeNotNull('IBAN', instance.iban);
  return val;
}
