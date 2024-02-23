class ProfileDto {
  final String fullName;
  final String userPicUrl;
  final String education;
  final int bankId;
  final String iban;
  final String username;
  final int id;

  ProfileDto(
      {required this.fullName,
      required this.userPicUrl,
      required this.education,
      required this.bankId,
      required this.iban,
      required this.username,
      required this.id});

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
