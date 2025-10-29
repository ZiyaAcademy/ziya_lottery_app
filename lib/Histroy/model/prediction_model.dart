// class PredictionModel {
//   final String title;
//   final String date;
//   final String prize;
//   final String plan;
//   final String result;
//   final String status; // "Completed", "Pending"
//   final String ticketNumber; // Added based on UI requirement

//   PredictionModel({
//     required this.title,
//     required this.date,
//     required this.prize,
//     required this.plan,
//     required this.result,
//     required this.status,
//     required this.ticketNumber, // Initialize the new field
//   });
// }
class PredictionModel {
  final String title;
  final String date;
  final String prize;
  final String plan;
  final String result;
  final String status; // "Completed" or "Pending"
  final String ticketNumber; // e.g. "WN 432556" or "AK 789234"

  PredictionModel({
    required this.title,
    required this.date,
    required this.prize,
    required this.plan,
    required this.result,
    required this.status,
    required this.ticketNumber,
  });
}
