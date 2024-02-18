// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'quiz.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'quiz.enums.swagger.dart' as enums;
export 'quiz.enums.swagger.dart';
export 'quiz.models.swagger.dart';

part 'quiz.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Quiz extends ChopperService {
  static Quiz create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$Quiz(client);
    }

    final newClient = ChopperClient(
        services: [_$Quiz()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Quiz(newClient);
  }

  ///
  Future<chopper.Response> apiV1AuthTokenPost({
    String? grantType,
    String? username,
    String? password,
    dynamic userRole,
    String? refreshToken,
    String? scope,
    String? clientId,
    String? clientSecret,
  }) {
    return _apiV1AuthTokenPost(
        grantType: grantType,
        username: username,
        password: password,
        userRole: userRole,
        refreshToken: refreshToken,
        scope: scope,
        clientId: clientId,
        clientSecret: clientSecret);
  }

  ///
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/Token',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response> _apiV1AuthTokenPost({
    @Part('grant_type') String? grantType,
    @Part('username') String? username,
    @Part('password') String? password,
    @Part('UserRole') dynamic userRole,
    @Part('refresh_token') String? refreshToken,
    @Part('scope') String? scope,
    @Part('client_id') String? clientId,
    @Part('client_secret') String? clientSecret,
  });

  ///Register
  Future<chopper.Response> apiV1AuthRegisterPost({required AuthDto? body}) {
    return _apiV1AuthRegisterPost(body: body);
  }

  ///Register
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/Register',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1AuthRegisterPost(
      {@Body() required AuthDto? body});

  ///
  Future<chopper.Response> apiV1AuthAccountVerificationPost(
      {required AuthConfirmDto? body}) {
    return _apiV1AuthAccountVerificationPost(body: body);
  }

  ///
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/AccountVerification',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1AuthAccountVerificationPost(
      {@Body() required AuthConfirmDto? body});

  ///
  Future<chopper.Response> apiV1AuthSelectPasswordPost({
    required String? password,
    required String? confirmPassword,
  }) {
    return _apiV1AuthSelectPasswordPost(
        password: password, confirmPassword: confirmPassword);
  }

  ///
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/SelectPassword',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response> _apiV1AuthSelectPasswordPost({
    @Part('Password') required String? password,
    @Part('ConfirmPassword') required String? confirmPassword,
  });

  ///Send Code
  Future<chopper.Response> apiV1AuthSendCodePost({required AuthDto? body}) {
    return _apiV1AuthSendCodePost(body: body);
  }

  ///Send Code
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/SendCode',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1AuthSendCodePost(
      {@Body() required AuthDto? body});

  ///OAuth
  Future<chopper.Response> apiV1AuthOAuthPost({required AuthConfirmDto? body}) {
    return _apiV1AuthOAuthPost(body: body);
  }

  ///OAuth
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/OAuth',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1AuthOAuthPost(
      {@Body() required AuthConfirmDto? body});

  ///select recovery type by PhoneNumber and GenerateCodeConfirmed
  Future<chopper.Response> apiV1AuthForgotPasswordPost({
    required String? userName,
    String? autoCode,
  }) {
    return _apiV1AuthForgotPasswordPost(userName: userName, autoCode: autoCode);
  }

  ///select recovery type by PhoneNumber and GenerateCodeConfirmed
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/ForgotPassword',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response> _apiV1AuthForgotPasswordPost({
    @Part('UserName') required String? userName,
    @Part('auto_code') String? autoCode,
  });

  ///Change Password by Phonenumber
  Future<chopper.Response> apiV1AuthChangePasswordPost({
    required String? userName,
    required String? verificationCode,
    required String? password,
    required String? confirmPassword,
  }) {
    return _apiV1AuthChangePasswordPost(
        userName: userName,
        verificationCode: verificationCode,
        password: password,
        confirmPassword: confirmPassword);
  }

  ///Change Password by Phonenumber
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/ChangePassword',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response> _apiV1AuthChangePasswordPost({
    @Part('UserName') required String? userName,
    @Part('VerificationCode') required String? verificationCode,
    @Part('Password') required String? password,
    @Part('ConfirmPassword') required String? confirmPassword,
  });

  ///
  Future<chopper.Response> apiV1AuthIsAuthenticatedGet() {
    return _apiV1AuthIsAuthenticatedGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/IsAuthenticated')
  Future<chopper.Response> _apiV1AuthIsAuthenticatedGet();

  ///
  Future<chopper.Response> apiV1BanerGetBannerGet() {
    return _apiV1BanerGetBannerGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Baner/GetBanner')
  Future<chopper.Response> _apiV1BanerGetBannerGet();

  ///Creates a ContactUs
  Future<chopper.Response<ContactusSelectDtoApiResult>> apiV1ContactUsPost({
    required String? fullName,
    String? phoneNumber,
    String? email,
    required String? messageText,
    String? subjectText,
    required int? id,
  }) {
    generatedMapping.putIfAbsent(ContactusSelectDtoApiResult,
        () => ContactusSelectDtoApiResult.fromJsonFactory);

    return _apiV1ContactUsPost(
        fullName: fullName,
        phoneNumber: phoneNumber,
        email: email,
        messageText: messageText,
        subjectText: subjectText,
        id: id);
  }

  ///Creates a ContactUs
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/ContactUs',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response<ContactusSelectDtoApiResult>> _apiV1ContactUsPost({
    @Part('FullName') required String? fullName,
    @Part('PhoneNumber') String? phoneNumber,
    @Part('Email') String? email,
    @Part('MessageText') required String? messageText,
    @Part('SubjectText') String? subjectText,
    @Part('Id') required int? id,
  });

  ///
  ///@param PageNumber
  ///@param PageSize
  Future<chopper.Response<List<FAQSelectDto>>> apiV1FAQPagedListGet({
    int? pageNumber,
    int? pageSize,
  }) {
    generatedMapping.putIfAbsent(
        FAQSelectDto, () => FAQSelectDto.fromJsonFactory);

    return _apiV1FAQPagedListGet(pageNumber: pageNumber, pageSize: pageSize);
  }

  ///
  ///@param PageNumber
  ///@param PageSize
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/FAQ/PagedList')
  Future<chopper.Response<List<FAQSelectDto>>> _apiV1FAQPagedListGet({
    @Query('PageNumber') int? pageNumber,
    @Query('PageSize') int? pageSize,
  });

  ///
  ///@param QuestionId
  Future<chopper.Response> apiV1ReportQuestionSubmitReportPost(
      {int? questionId}) {
    return _apiV1ReportQuestionSubmitReportPost(questionId: questionId);
  }

  ///
  ///@param QuestionId
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/ReportQuestion/SubmitReport',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1ReportQuestionSubmitReportPost(
      {@Query('QuestionId') int? questionId});

  ///
  Future<chopper.Response> apiV1ScoreGetRewardListGet() {
    return _apiV1ScoreGetRewardListGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetRewardList')
  Future<chopper.Response> _apiV1ScoreGetRewardListGet();

  ///
  Future<chopper.Response> apiV1ScoreGetDailyRewardListGet() {
    return _apiV1ScoreGetDailyRewardListGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetDailyRewardList')
  Future<chopper.Response> _apiV1ScoreGetDailyRewardListGet();

  ///
  Future<chopper.Response> apiV1ScoreGetUserChangeScoreDayListGet() {
    return _apiV1ScoreGetUserChangeScoreDayListGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetUserChangeScoreDayList')
  Future<chopper.Response> _apiV1ScoreGetUserChangeScoreDayListGet();

  ///
  Future<chopper.Response> apiV1ScoreGetUserChangeScoreDayListV0Get() {
    return _apiV1ScoreGetUserChangeScoreDayListV0Get();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetUserChangeScoreDayList_V0')
  Future<chopper.Response> _apiV1ScoreGetUserChangeScoreDayListV0Get();

  ///
  Future<chopper.Response> apiV1ScoreGetUserChangeScoreDayGet() {
    return _apiV1ScoreGetUserChangeScoreDayGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetUserChangeScoreDay')
  Future<chopper.Response> _apiV1ScoreGetUserChangeScoreDayGet();

  ///
  Future<chopper.Response> apiV1ScoreGetUserChangeScoreMonthListGet() {
    return _apiV1ScoreGetUserChangeScoreMonthListGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetUserChangeScoreMonthList')
  Future<chopper.Response> _apiV1ScoreGetUserChangeScoreMonthListGet();

  ///
  Future<chopper.Response> apiV1ScoreUserRankingisLowerThan50Get() {
    return _apiV1ScoreUserRankingisLowerThan50Get();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/UserRankingisLowerThan50')
  Future<chopper.Response> _apiV1ScoreUserRankingisLowerThan50Get();

  ///
  Future<chopper.Response> apiV1ScoreGetUserRankGet() {
    return _apiV1ScoreGetUserRankGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetUserRank')
  Future<chopper.Response> _apiV1ScoreGetUserRankGet();

  ///
  ///@param IsWatchAds
  Future<chopper.Response> apiV1ScoreAddScorePost({bool? isWatchAds}) {
    return _apiV1ScoreAddScorePost(isWatchAds: isWatchAds);
  }

  ///
  ///@param IsWatchAds
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/AddScore',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1ScoreAddScorePost(
      {@Query('IsWatchAds') bool? isWatchAds});

  ///
  ///@param dateTime
  ///@param count
  Future<chopper.Response> apiV1ScoreMaxScoreOfMonthScoreGet({
    DateTime? dateTime,
    int? count,
  }) {
    return _apiV1ScoreMaxScoreOfMonthScoreGet(dateTime: dateTime, count: count);
  }

  ///
  ///@param dateTime
  ///@param count
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/MaxScoreOfMonthScore')
  Future<chopper.Response> _apiV1ScoreMaxScoreOfMonthScoreGet({
    @Query('dateTime') DateTime? dateTime,
    @Query('count') int? count,
  });

  ///مشاهده امتیاز کسب شده من در ماه
  ///@param dateTime
  Future<chopper.Response> apiV1ScoreGetMyScoreInMonthGet(
      {DateTime? dateTime}) {
    return _apiV1ScoreGetMyScoreInMonthGet(dateTime: dateTime);
  }

  ///مشاهده امتیاز کسب شده من در ماه
  ///@param dateTime
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetMyScoreInMonth')
  Future<chopper.Response> _apiV1ScoreGetMyScoreInMonthGet(
      {@Query('dateTime') DateTime? dateTime});

  ///
  Future<chopper.Response> apiV1ScoreGetUserBalanceGet() {
    return _apiV1ScoreGetUserBalanceGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetUserBalance')
  Future<chopper.Response> _apiV1ScoreGetUserBalanceGet();

  ///
  ///@param dateTime
  Future<chopper.Response> apiV1ScoreGetMyMonthStateGet({DateTime? dateTime}) {
    return _apiV1ScoreGetMyMonthStateGet(dateTime: dateTime);
  }

  ///
  ///@param dateTime
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetMyMonthState')
  Future<chopper.Response> _apiV1ScoreGetMyMonthStateGet(
      {@Query('dateTime') DateTime? dateTime});

  ///
  Future<chopper.Response> apiV1SettingGetBanksGet() {
    return _apiV1SettingGetBanksGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Setting/GetBanks')
  Future<chopper.Response> _apiV1SettingGetBanksGet();

  ///Retrieves a Setting by unique id
  Future<chopper.Response> apiV1SettingGetSettingGet() {
    return _apiV1SettingGetSettingGet();
  }

  ///Retrieves a Setting by unique id
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Setting/GetSetting')
  Future<chopper.Response> _apiV1SettingGetSettingGet();

  ///
  ///@param key
  Future<chopper.Response> apiV1StartQuizSetStTaGet({String? key}) {
    return _apiV1StartQuizSetStTaGet(key: key);
  }

  ///
  ///@param key
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/setStTa')
  Future<chopper.Response> _apiV1StartQuizSetStTaGet(
      {@Query('key') String? key});

  ///
  ///@param key
  ///@param cou
  Future<chopper.Response> apiV1StartQuizDeUDQQGet({
    String? key,
    int? cou,
  }) {
    return _apiV1StartQuizDeUDQQGet(key: key, cou: cou);
  }

  ///
  ///@param key
  ///@param cou
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/deUDQQ')
  Future<chopper.Response> _apiV1StartQuizDeUDQQGet({
    @Query('key') String? key,
    @Query('cou') int? cou,
  });

  ///
  ///@param key
  ///@param cou
  Future<chopper.Response> apiV1StartQuizDeUQQGet({
    String? key,
    int? cou,
  }) {
    return _apiV1StartQuizDeUQQGet(key: key, cou: cou);
  }

  ///
  ///@param key
  ///@param cou
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/deUQQ')
  Future<chopper.Response> _apiV1StartQuizDeUQQGet({
    @Query('key') String? key,
    @Query('cou') int? cou,
  });

  ///
  ///@param key
  Future<chopper.Response> apiV1StartQuizSetStTa11Get({String? key}) {
    return _apiV1StartQuizSetStTa11Get(key: key);
  }

  ///
  ///@param key
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/setStTa11')
  Future<chopper.Response> _apiV1StartQuizSetStTa11Get(
      {@Query('key') String? key});

  ///شروع کوئیز و اختصاص سوال به کاربر
  Future<chopper.Response> apiV1StartQuizStartQuizGet() {
    return _apiV1StartQuizStartQuizGet();
  }

  ///شروع کوئیز و اختصاص سوال به کاربر
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/StartQuiz')
  Future<chopper.Response> _apiV1StartQuizStartQuizGet();

  ///ثبت جواب کاربر
  ///@param UserQuizId
  ///@param UserDQuizId
  ///@param QuestionId
  ///@param SelectedAnswer
  Future<chopper.Response> apiV1StartQuizAddAnswerPost({
    int? userQuizId,
    int? userDQuizId,
    int? questionId,
    int? selectedAnswer,
  }) {
    return _apiV1StartQuizAddAnswerPost(
        userQuizId: userQuizId,
        userDQuizId: userDQuizId,
        questionId: questionId,
        selectedAnswer: selectedAnswer);
  }

  ///ثبت جواب کاربر
  ///@param UserQuizId
  ///@param UserDQuizId
  ///@param QuestionId
  ///@param SelectedAnswer
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/AddAnswer',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1StartQuizAddAnswerPost({
    @Query('UserQuizId') int? userQuizId,
    @Query('UserDQuizId') int? userDQuizId,
    @Query('QuestionId') int? questionId,
    @Query('SelectedAnswer') int? selectedAnswer,
  });

  ///کسر امتیاز و مشاهده درصد
  ///@param QuestionId
  Future<chopper.Response> apiV1StartQuizShowPercentSelectedAnswerGet(
      {int? questionId}) {
    return _apiV1StartQuizShowPercentSelectedAnswerGet(questionId: questionId);
  }

  ///کسر امتیاز و مشاهده درصد
  ///@param QuestionId
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/ShowPercentSelectedAnswer')
  Future<chopper.Response> _apiV1StartQuizShowPercentSelectedAnswerGet(
      {@Query('QuestionId') int? questionId});

  ///کسر امتیاز و مشاهده اشتباه
  ///@param QuestionId
  Future<chopper.Response> apiV1StartQuizShowWrongAnswerGet({int? questionId}) {
    return _apiV1StartQuizShowWrongAnswerGet(questionId: questionId);
  }

  ///کسر امتیاز و مشاهده اشتباه
  ///@param QuestionId
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/ShowWrongAnswer')
  Future<chopper.Response> _apiV1StartQuizShowWrongAnswerGet(
      {@Query('QuestionId') int? questionId});

  ///
  Future<chopper.Response> apiV1StartQuizTodayMyQuizStateGet() {
    return _apiV1StartQuizTodayMyQuizStateGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/TodayMyQuizState')
  Future<chopper.Response> _apiV1StartQuizTodayMyQuizStateGet();

  ///
  Future<chopper.Response> apiV1StartQuizMonthMyQuizStateGet() {
    return _apiV1StartQuizMonthMyQuizStateGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/MonthMyQuizState')
  Future<chopper.Response> _apiV1StartQuizMonthMyQuizStateGet();

  ///فیلتر وضعیت کوئیز با تاریخ و تعداد جواب صحیح کوئیز
  ///@param dateTime
  ///@param CurrectAnswer
  Future<chopper.Response> apiV1StartQuizShowUserByAnswerCountGet({
    DateTime? dateTime,
    int? currectAnswer,
  }) {
    return _apiV1StartQuizShowUserByAnswerCountGet(
        dateTime: dateTime, currectAnswer: currectAnswer);
  }

  ///فیلتر وضعیت کوئیز با تاریخ و تعداد جواب صحیح کوئیز
  ///@param dateTime
  ///@param CurrectAnswer
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/ShowUserByAnswerCount')
  Future<chopper.Response> _apiV1StartQuizShowUserByAnswerCountGet({
    @Query('dateTime') DateTime? dateTime,
    @Query('CurrectAnswer') int? currectAnswer,
  });

  ///وضعیت کوئیز با تاریخ و چند نفر چندتا رو درست گفتن
  ///@param dateTime
  Future<chopper.Response> apiV1StartQuizShowUserAnswerCountGet(
      {DateTime? dateTime}) {
    return _apiV1StartQuizShowUserAnswerCountGet(dateTime: dateTime);
  }

  ///وضعیت کوئیز با تاریخ و چند نفر چندتا رو درست گفتن
  ///@param dateTime
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/ShowUserAnswerCount')
  Future<chopper.Response> _apiV1StartQuizShowUserAnswerCountGet(
      {@Query('dateTime') DateTime? dateTime});

  ///
  ///@param dateTime
  Future<chopper.Response> apiV1StartQuizShowUserWrongAnserCountGet(
      {DateTime? dateTime}) {
    return _apiV1StartQuizShowUserWrongAnserCountGet(dateTime: dateTime);
  }

  ///
  ///@param dateTime
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/ShowUserWrongAnserCount')
  Future<chopper.Response> _apiV1StartQuizShowUserWrongAnserCountGet(
      {@Query('dateTime') DateTime? dateTime});

  ///
  ///@param QuizId
  Future<chopper.Response> apiV1StartQuizViewUserQuizReportByQuizIdGet(
      {int? quizId}) {
    return _apiV1StartQuizViewUserQuizReportByQuizIdGet(quizId: quizId);
  }

  ///
  ///@param QuizId
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/ViewUserQuizReportByQuizId')
  Future<chopper.Response> _apiV1StartQuizViewUserQuizReportByQuizIdGet(
      {@Query('QuizId') int? quizId});

  ///
  ///@param selecteddatetime
  Future<chopper.Response> apiV1StartQuizAnsweredCountInMonthListGet(
      {DateTime? selecteddatetime}) {
    return _apiV1StartQuizAnsweredCountInMonthListGet(
        selecteddatetime: selecteddatetime);
  }

  ///
  ///@param selecteddatetime
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/AnsweredCountInMonthList')
  Future<chopper.Response> _apiV1StartQuizAnsweredCountInMonthListGet(
      {@Query('selecteddatetime') DateTime? selecteddatetime});

  ///
  Future<chopper.Response> apiV1TicketTestUserGet() {
    return _apiV1TicketTestUserGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/testUser')
  Future<chopper.Response> _apiV1TicketTestUserGet();

  ///
  Future<chopper.Response> apiV1TicketTestUserwPost({
    String? subject,
    dynamic priority,
    required int? id,
    required String? desc,
  }) {
    return _apiV1TicketTestUserwPost(
        subject: subject, priority: priority, id: id, desc: desc);
  }

  ///
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/testUserw',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response> _apiV1TicketTestUserwPost({
    @Part('Subject') String? subject,
    @Part('Priority') dynamic priority,
    @Part('Id') required int? id,
    @Part('Desc') required String? desc,
  });

  ///ارسال تیکت توسط کاربر
  Future<chopper.Response<ApiResult>> apiV1TicketCreateTicketByUserPost({
    String? subject,
    dynamic priority,
    required int? id,
    required String? desc,
  }) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1TicketCreateTicketByUserPost(
        subject: subject, priority: priority, id: id, desc: desc);
  }

  ///ارسال تیکت توسط کاربر
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/CreateTicketByUser',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response<ApiResult>> _apiV1TicketCreateTicketByUserPost({
    @Part('Subject') String? subject,
    @Part('Priority') dynamic priority,
    @Part('Id') required int? id,
    @Part('Desc') required String? desc,
  });

  ///اضافه کردن جواب تیکت توسط کاربر
  ///@param ticketId
  Future<chopper.Response> apiV1TicketAddTicketAnswerByUserPost({
    int? ticketId,
    required String? desc,
    required int? id,
  }) {
    return _apiV1TicketAddTicketAnswerByUserPost(
        ticketId: ticketId, desc: desc, id: id);
  }

  ///اضافه کردن جواب تیکت توسط کاربر
  ///@param ticketId
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/AddTicketAnswerByUser',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response> _apiV1TicketAddTicketAnswerByUserPost({
    @Query('ticketId') int? ticketId,
    @Part('Desc') required String? desc,
    @Part('Id') required int? id,
  });

  ///لیست تیکت های کابر با قابلیت فیلتر براساس وضعیت تیکت
  ///@param ticketState
  ///@param PageNumber
  ///@param PageSize
  Future<chopper.Response<List<TicketSelectDto>>> apiV1TicketUserTicketListGet({
    enums.TicketState? ticketState,
    int? pageNumber,
    int? pageSize,
  }) {
    generatedMapping.putIfAbsent(
        TicketSelectDto, () => TicketSelectDto.fromJsonFactory);

    return _apiV1TicketUserTicketListGet(
        ticketState: ticketState?.value?.toString(),
        pageNumber: pageNumber,
        pageSize: pageSize);
  }

  ///لیست تیکت های کابر با قابلیت فیلتر براساس وضعیت تیکت
  ///@param ticketState
  ///@param PageNumber
  ///@param PageSize
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/UserTicketList')
  Future<chopper.Response<List<TicketSelectDto>>>
      _apiV1TicketUserTicketListGet({
    @Query('ticketState') String? ticketState,
    @Query('PageNumber') int? pageNumber,
    @Query('PageSize') int? pageSize,
  });

  ///جزئیات Ticket و لیست TicketAnswer
  ///@param ticketId
  Future<chopper.Response> apiV1TicketTicketDetailGet({int? ticketId}) {
    return _apiV1TicketTicketDetailGet(ticketId: ticketId);
  }

  ///جزئیات Ticket و لیست TicketAnswer
  ///@param ticketId
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/TicketDetail')
  Future<chopper.Response> _apiV1TicketTicketDetailGet(
      {@Query('ticketId') int? ticketId});

  ///
  Future<chopper.Response> apiV1TicketSeenTicketPost(
      {required List<int>? body}) {
    return _apiV1TicketSeenTicketPost(body: body);
  }

  ///
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/SeenTicket',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1TicketSeenTicketPost(
      {@Body() required List<int>? body});

  ///
  Future<chopper.Response> apiV1TicketUnreadedTicketCountPost() {
    return _apiV1TicketUnreadedTicketCountPost();
  }

  ///
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/UnreadedTicketCount',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1TicketUnreadedTicketCountPost();

  ///
  Future<chopper.Response> apiV1UserManagerViewProfileGet() {
    return _apiV1UserManagerViewProfileGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/ViewProfile')
  Future<chopper.Response> _apiV1UserManagerViewProfileGet();

  ///
  ///@param count
  Future<chopper.Response> apiV1UserManagerAddScorePost({int? count}) {
    return _apiV1UserManagerAddScorePost(count: count);
  }

  ///
  ///@param count
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/AddScore',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1UserManagerAddScorePost(
      {@Query('count') int? count});

  ///
  Future<chopper.Response> apiV1UserManagerEditProfilePost({
    required String? fullName,
    List<int>? file,
    String? education,
    int? bankId,
    String? iban,
  }) {
    return _apiV1UserManagerEditProfilePost(
        fullName: fullName,
        file: file,
        education: education,
        bankId: bankId,
        iban: iban);
  }

  ///
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/EditProfile',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response> _apiV1UserManagerEditProfilePost({
    @Part('FullName') required String? fullName,
    @PartFile() List<int>? file,
    @Part('Education') String? education,
    @Part('BankId') int? bankId,
    @Part('IBAN') String? iban,
  });

  ///
  Future<chopper.Response> apiV1UserManagerBlockUserGet() {
    return _apiV1UserManagerBlockUserGet();
  }

  ///
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/BlockUser')
  Future<chopper.Response> _apiV1UserManagerBlockUserGet();

  ///
  ///@param NewPhonenumber
  ///@param auto_code
  Future<chopper.Response> apiV1UserManagerUpdatePhoneNumberGet({
    String? newPhonenumber,
    String? autoCode,
  }) {
    return _apiV1UserManagerUpdatePhoneNumberGet(
        newPhonenumber: newPhonenumber, autoCode: autoCode);
  }

  ///
  ///@param NewPhonenumber
  ///@param auto_code
  @Get(path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/UpdatePhoneNumber')
  Future<chopper.Response> _apiV1UserManagerUpdatePhoneNumberGet({
    @Query('NewPhonenumber') String? newPhonenumber,
    @Query('auto_code') String? autoCode,
  });

  ///
  Future<chopper.Response> apiV1UserManagerUpdatePhoneNumberPost(
      {required UpdatePhoneNumberDto? body}) {
    return _apiV1UserManagerUpdatePhoneNumberPost(body: body);
  }

  ///
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/UpdatePhoneNumber',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1UserManagerUpdatePhoneNumberPost(
      {@Body() required UpdatePhoneNumberDto? body});

  ///
  Future<chopper.Response> apiV1UserManagerRemoveUserProfilePost() {
    return _apiV1UserManagerRemoveUserProfilePost();
  }

  ///
  @Post(
    path: 'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/RemoveUserProfile',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1UserManagerRemoveUserProfilePost();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
