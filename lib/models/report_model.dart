import 'package:cloud_firestore/cloud_firestore.dart';

/* Future<void> uploadReportToDatabase({
  required String donorName,
  required String donorPhone,
  required String donorLocation,
  required String donorAge,
  required String gender,
  required String locationLat,
  required String locationLong,
  required String dropdownValue,
}) async {
  CollectionReference users = FirebaseFirestore.instance.collection('donating');
  FirebaseAuth auth = FirebaseAuth.instance;
  String? uid = auth.currentUser?.uid.toString();
  users.add({
    'donorName': donorName,
    'donorPhone': donorPhone,
    'donorLocation': donorLocation,
    'uid': uid,
    'donorAge': donorAge,
    "LocationLat": locationLat,
    "LocationLong": locationLong,
    "gender": gender,
    'timestamp': FieldValue.serverTimestamp(),
    "bloodGroup": dropdownValue,
  });
  return;
} */
class ReportModel {
  final String locationLat;
  final String locationLong;
  final String gender;
  final String donorAge;
  final String donorLocation;
  final String uid;
  final Timestamp timestamp;
  final String donorPhone;
  final String donorName;
  final String bloodGroup;

  ReportModel(
      {required this.locationLat,
      required this.locationLong,
      required this.gender,
      required this.donorAge,
      required this.donorLocation,
      required this.uid,
      required this.timestamp,
      required this.donorPhone,
      required this.donorName,
      required this.bloodGroup});

  Map<String, dynamic> toJson() => {
        "LocationLat": locationLat,
        "LocationLong": locationLong,
        "gender": gender,
        "timestamp": timestamp,
        "donorAge": donorAge,
        "donorLocation": donorLocation,
        "uid": uid,
        "donorPhone": donorPhone,
        "donorName": donorName,
        "bloodGroup": bloodGroup,
      };

  static ReportModel fromJson(Map<String, dynamic> json) => ReportModel(
        gender: json['gender'],
        locationLat: json['LocationLat'],
        locationLong: json['LocationLong'],
        donorAge: json['donorAge'],
        donorLocation: json['donorLocation'],
        timestamp: json['timestamp'],
        donorName: json['donorName'],
        donorPhone: json['donorPhone'],
        uid: json['uid'],
        bloodGroup: json['bloodGroup'],
      );
}
