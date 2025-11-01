// class PredictionModel {
//   final String name;
//   final String prize;
//   final String amount;

//   PredictionModel({
//     required this.name,
//     required this.prize,
//     required this.amount,
//   });
// }
class PredictionModel {
  final String name;
  final String prize;
  final String amount;

  PredictionModel({
    required this.name,
    required this.prize,
    required this.amount,
  });

  // Easily API-connectable
  factory PredictionModel.fromJson(Map<String, dynamic> json) {
    return PredictionModel(
      name: json['name'] ?? '',
      prize: json['prize'] ?? '',
      amount: json['amount'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'prize': prize,
        'amount': amount,
      };
}
