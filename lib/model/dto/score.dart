class UserScore {
  final int applicationUserId;
  final String applicationUserUserName;
  final String? applicationUserFullName;
  final String? applicationUserUserPicUrl;
  final int currectAnswer;
  final int wrongAnswer;
  final int sumWrongAnswer;
  final int sumCurrectAnswer;
  final String addedDate;
  final String createDate;
  final int changes;
  final int id;

  UserScore({
    required this.applicationUserId,
    required this.applicationUserUserName,
    this.applicationUserFullName,
    this.applicationUserUserPicUrl,
    required this.currectAnswer,
    required this.wrongAnswer,
    required this.sumWrongAnswer,
    required this.sumCurrectAnswer,
    required this.addedDate,
    required this.createDate,
    required this.changes,
    required this.id,
  });

  static UserScore fromJson(json) {
    return UserScore(
      applicationUserId: json['applicationUserId'],
      applicationUserUserName: json['applicationUserUserName'],
      applicationUserFullName: json['applicationUserFullName'],
      applicationUserUserPicUrl: json['applicationUserUserPicUrl'],
      currectAnswer: json['currectAnswer'],
      wrongAnswer: json['wrongAnswer'],
      sumWrongAnswer: json['sumWrongAnswer'],
      sumCurrectAnswer: json['sumCurrectAnswer'],
      addedDate: json['addedDate'],
      createDate: json['createDate'],
      changes: json['changes'],
      id: json['id'],
    );
  }
}
