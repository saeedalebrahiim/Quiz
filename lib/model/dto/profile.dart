class ProfileDto {
  final String? fullName;
  final String? userPicUrl;
  final String? education;
  final int? bankId;
  final String? iban;
  final String? username;
  final int? id;
  final int? userScoreBalance;
  final int? userWalletBalance;
  final int? userGemBalance;
  final int? userCurrectAnswer_1000;

  ProfileDto(
      {this.fullName,
      this.userPicUrl,
      this.education,
      this.bankId,
      this.iban,
      this.username,
      this.userScoreBalance,
      this.userWalletBalance,
      this.userGemBalance,
      this.userCurrectAnswer_1000,
      this.id});

  static ProfileDto fromJson(json) {
    return ProfileDto(
      fullName: json['fullName'],
      userPicUrl: json['userPicUrl'],
      education: json['education'],
      bankId: json['bankId'],
      iban: json['iban'],
      username: json['username'],
      userScoreBalance: json['userScoreBalance'],
      userWalletBalance: json['userWalletBalance'],
      userGemBalance: json['userGemBalance'],
      userCurrectAnswer_1000: json['userCurrectAnswer_1000'],
      id: json['id'],
    );
  }
}
