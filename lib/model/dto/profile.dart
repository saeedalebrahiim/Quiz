class ProfileDto {
  final String? fullName;
  final String? userPicUrl;
  final String? education;
  final int? bankId;
  final String? iban;
  final String? username;
  final int? id;

  ProfileDto(
      {this.fullName,
      this.userPicUrl,
      this.education,
      this.bankId,
      this.iban,
      this.username,
      this.id});

  static ProfileDto fromJson(json) {
    return ProfileDto(
      fullName: json['fullName'],
      userPicUrl: json['userPicUrl'],
      education: json['education'],
      bankId: json['bankId'],
      iban: json['iban'],
      username: json['username'],
      id: json['id'],
    );
  }
}
