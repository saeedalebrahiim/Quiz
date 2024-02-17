// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$Quiz extends Quiz {
  _$Quiz([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = Quiz;

  @override
  Future<Response<dynamic>> _apiV1AuthTokenPost({
    String? grantType,
    String? username,
    String? password,
    dynamic userRole,
    String? refreshToken,
    String? scope,
    String? clientId,
    String? clientSecret,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/Token');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>(
        'grant_type',
        grantType,
      ),
      PartValue<String?>(
        'username',
        username,
      ),
      PartValue<String?>(
        'password',
        password,
      ),
      PartValue<dynamic>(
        'UserRole',
        userRole,
      ),
      PartValue<String?>(
        'refresh_token',
        refreshToken,
      ),
      PartValue<String?>(
        'scope',
        scope,
      ),
      PartValue<String?>(
        'client_id',
        clientId,
      ),
      PartValue<String?>(
        'client_secret',
        clientSecret,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1AuthRegisterPost({required AuthDto? body}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/Register');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1AuthAccountVerificationPost(
      {required AuthConfirmDto? body}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/AccountVerification');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1AuthSelectPasswordPost({
    required String? password,
    required String? confirmPassword,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/SelectPassword');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>(
        'Password',
        password,
      ),
      PartValue<String?>(
        'ConfirmPassword',
        confirmPassword,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1AuthSendCodePost({required AuthDto? body}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/SendCode');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1AuthOAuthPost(
      {required AuthConfirmDto? body}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/OAuth');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1AuthForgotPasswordPost({
    required String? userName,
    String? autoCode,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/ForgotPassword');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>(
        'UserName',
        userName,
      ),
      PartValue<String?>(
        'auto_code',
        autoCode,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1AuthChangePasswordPost({
    required String? userName,
    required String? verificationCode,
    required String? password,
    required String? confirmPassword,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/ChangePassword');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>(
        'UserName',
        userName,
      ),
      PartValue<String?>(
        'VerificationCode',
        verificationCode,
      ),
      PartValue<String?>(
        'Password',
        password,
      ),
      PartValue<String?>(
        'ConfirmPassword',
        confirmPassword,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1AuthIsAuthenticatedGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Auth/IsAuthenticated');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1BanerGetBannerGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Baner/GetBanner');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ContactusSelectDtoApiResult>> _apiV1ContactUsPost({
    required String? fullName,
    String? phoneNumber,
    String? email,
    required String? messageText,
    String? subjectText,
    required int? id,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/ContactUs');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>(
        'FullName',
        fullName,
      ),
      PartValue<String?>(
        'PhoneNumber',
        phoneNumber,
      ),
      PartValue<String?>(
        'Email',
        email,
      ),
      PartValue<String?>(
        'MessageText',
        messageText,
      ),
      PartValue<String?>(
        'SubjectText',
        subjectText,
      ),
      PartValue<int?>(
        'Id',
        id,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<ContactusSelectDtoApiResult,
        ContactusSelectDtoApiResult>($request);
  }

  @override
  Future<Response<List<FAQSelectDto>>> _apiV1FAQPagedListGet({
    int? pageNumber,
    int? pageSize,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/FAQ/PagedList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'PageNumber': pageNumber,
      'PageSize': pageSize,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<FAQSelectDto>, FAQSelectDto>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ReportQuestionSubmitReportPost(
      {int? questionId}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/ReportQuestion/SubmitReport');
    final Map<String, dynamic> $params = <String, dynamic>{
      'QuestionId': questionId
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreGetRewardListGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetRewardList');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreGetDailyRewardListGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetDailyRewardList');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreGetUserChangeScoreDayListGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetUserChangeScoreDayList');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreGetUserChangeScoreDayListV0Get() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetUserChangeScoreDayList_V0');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreGetUserChangeScoreDayGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetUserChangeScoreDay');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreGetUserChangeScoreMonthListGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetUserChangeScoreMonthList');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreUserRankingisLowerThan50Get() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/UserRankingisLowerThan50');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreGetUserRankGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetUserRank');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreAddScorePost({bool? isWatchAds}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/AddScore');
    final Map<String, dynamic> $params = <String, dynamic>{
      'IsWatchAds': isWatchAds
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreMaxScoreOfMonthScoreGet({
    DateTime? dateTime,
    int? count,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/MaxScoreOfMonthScore');
    final Map<String, dynamic> $params = <String, dynamic>{
      'dateTime': dateTime,
      'count': count,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreGetMyScoreInMonthGet(
      {DateTime? dateTime}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetMyScoreInMonth');
    final Map<String, dynamic> $params = <String, dynamic>{
      'dateTime': dateTime
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreGetUserBalanceGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetUserBalance');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ScoreGetMyMonthStateGet(
      {DateTime? dateTime}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Score/GetMyMonthState');
    final Map<String, dynamic> $params = <String, dynamic>{
      'dateTime': dateTime
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1SettingGetBanksGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Setting/GetBanks');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1SettingGetSettingGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Setting/GetSetting');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizSetStTaGet({String? key}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/setStTa');
    final Map<String, dynamic> $params = <String, dynamic>{'key': key};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizDeUDQQGet({
    String? key,
    int? cou,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/deUDQQ');
    final Map<String, dynamic> $params = <String, dynamic>{
      'key': key,
      'cou': cou,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizDeUQQGet({
    String? key,
    int? cou,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/deUQQ');
    final Map<String, dynamic> $params = <String, dynamic>{
      'key': key,
      'cou': cou,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizSetStTa11Get({String? key}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/setStTa11');
    final Map<String, dynamic> $params = <String, dynamic>{'key': key};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizStartQuizGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/StartQuiz');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizAddAnswerPost({
    int? userQuizId,
    int? userDQuizId,
    int? questionId,
    int? selectedAnswer,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/AddAnswer');
    final Map<String, dynamic> $params = <String, dynamic>{
      'UserQuizId': userQuizId,
      'UserDQuizId': userDQuizId,
      'QuestionId': questionId,
      'SelectedAnswer': selectedAnswer,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizShowPercentSelectedAnswerGet(
      {int? questionId}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/ShowPercentSelectedAnswer');
    final Map<String, dynamic> $params = <String, dynamic>{
      'QuestionId': questionId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizShowWrongAnswerGet(
      {int? questionId}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/ShowWrongAnswer');
    final Map<String, dynamic> $params = <String, dynamic>{
      'QuestionId': questionId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizTodayMyQuizStateGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/TodayMyQuizState');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizMonthMyQuizStateGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/MonthMyQuizState');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizShowUserByAnswerCountGet({
    DateTime? dateTime,
    int? currectAnswer,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/ShowUserByAnswerCount');
    final Map<String, dynamic> $params = <String, dynamic>{
      'dateTime': dateTime,
      'CurrectAnswer': currectAnswer,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizShowUserAnswerCountGet(
      {DateTime? dateTime}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/ShowUserAnswerCount');
    final Map<String, dynamic> $params = <String, dynamic>{
      'dateTime': dateTime
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizShowUserWrongAnserCountGet(
      {DateTime? dateTime}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/ShowUserWrongAnserCount');
    final Map<String, dynamic> $params = <String, dynamic>{
      'dateTime': dateTime
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizViewUserQuizReportByQuizIdGet(
      {int? quizId}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/ViewUserQuizReportByQuizId');
    final Map<String, dynamic> $params = <String, dynamic>{'QuizId': quizId};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1StartQuizAnsweredCountInMonthListGet(
      {DateTime? selecteddatetime}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/StartQuiz/AnsweredCountInMonthList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'selecteddatetime': selecteddatetime
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1TicketTestUserGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/testUser');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1TicketTestUserwPost({
    String? subject,
    dynamic priority,
    required int? id,
    required String? desc,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/testUserw');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>(
        'Subject',
        subject,
      ),
      PartValue<dynamic>(
        'Priority',
        priority,
      ),
      PartValue<int?>(
        'Id',
        id,
      ),
      PartValue<String?>(
        'Desc',
        desc,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ApiResult>> _apiV1TicketCreateTicketByUserPost({
    String? subject,
    dynamic priority,
    required int? id,
    required String? desc,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/CreateTicketByUser');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>(
        'Subject',
        subject,
      ),
      PartValue<dynamic>(
        'Priority',
        priority,
      ),
      PartValue<int?>(
        'Id',
        id,
      ),
      PartValue<String?>(
        'Desc',
        desc,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<ApiResult, ApiResult>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1TicketAddTicketAnswerByUserPost({
    int? ticketId,
    required String? desc,
    required int? id,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/AddTicketAnswerByUser');
    final Map<String, dynamic> $params = <String, dynamic>{
      'ticketId': ticketId
    };
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>(
        'Desc',
        desc,
      ),
      PartValue<int?>(
        'Id',
        id,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<TicketSelectDto>>> _apiV1TicketUserTicketListGet({
    String? ticketState,
    int? pageNumber,
    int? pageSize,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/UserTicketList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'ticketState': ticketState,
      'PageNumber': pageNumber,
      'PageSize': pageSize,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<TicketSelectDto>, TicketSelectDto>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1TicketTicketDetailGet({int? ticketId}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/TicketDetail');
    final Map<String, dynamic> $params = <String, dynamic>{
      'ticketId': ticketId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1TicketSeenTicketPost(
      {required List<int>? body}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/SeenTicket');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1TicketUnreadedTicketCountPost() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/UnreadedTicketCount');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1UserManagerViewProfileGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/ViewProfile');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1UserManagerAddScorePost({int? count}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/AddScore');
    final Map<String, dynamic> $params = <String, dynamic>{'count': count};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1UserManagerEditProfilePost({
    required String? fullName,
    List<int>? file,
    String? education,
    int? bankId,
    String? iban,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/EditProfile');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>(
        'FullName',
        fullName,
      ),
      PartValue<String?>(
        'Education',
        education,
      ),
      PartValue<int?>(
        'BankId',
        bankId,
      ),
      PartValue<String?>(
        'IBAN',
        iban,
      ),
      PartValueFile<List<int>?>(
        'file',
        file,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1UserManagerBlockUserGet() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/BlockUser');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1UserManagerUpdatePhoneNumberGet({
    String? newPhonenumber,
    String? autoCode,
  }) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/UpdatePhoneNumber');
    final Map<String, dynamic> $params = <String, dynamic>{
      'NewPhonenumber': newPhonenumber,
      'auto_code': autoCode,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1UserManagerUpdatePhoneNumberPost(
      {required UpdatePhoneNumberDto? body}) {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/UpdatePhoneNumber');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1UserManagerRemoveUserProfilePost() {
    final Uri $url = Uri.parse(
        'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/RemoveUserProfile');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
