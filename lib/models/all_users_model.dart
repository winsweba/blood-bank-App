import 'package:cloud_firestore/cloud_firestore.dart';

class AllUsers {
  final String phoneNumber;
  final String userEmail;
  final String userId;
  final String userNme;
  final Timestamp timestamp;

  AllUsers({
    required this.phoneNumber,
    required this.userEmail,
    required this.userId,
    required this.userNme,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "userEmail": userEmail,
        "userId": userId,
        "userNme": userNme,
        "timestamp": timestamp,
      };

  static AllUsers fromJson(Map<String, dynamic> json) => AllUsers(
      phoneNumber: json['phoneNumber'],
      userEmail: json['userEmail'],
      userId: json['userId'],
      userNme: json["userNme"],
      timestamp: json["timestamp"]);
}
