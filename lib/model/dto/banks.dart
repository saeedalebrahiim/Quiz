class BankDto {
  final String title;
  final int id;

  BankDto({
    required this.title,
    required this.id,
  });

  static BankDto fromJson(json) {
    return BankDto(
      title: json['title'],
      id: json['id'],
    );
  }
}
