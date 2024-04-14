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
      id: json['id'],
    );
  }
}
