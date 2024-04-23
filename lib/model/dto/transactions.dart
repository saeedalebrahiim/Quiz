class TransactionDto {
  final String createDate;
  final int price;
  final bool isPayed;
  final String? desc;
  final int id;

  TransactionDto({
    required this.price,
    required this.isPayed,
    this.desc,
    required this.createDate,
    required this.id,
  });

  static TransactionDto fromJson(json) {
    return TransactionDto(
      price: json['price'],
      isPayed: json['isPayed'],
      desc: json['desc'],
      createDate: json['createDate'],
      id: json['id'],
    );
  }
}
