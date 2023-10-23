class AllBloodModel {
  final String amountAp;
  final String amountAm;
  final String amountBp;
  final String amountBm;
  final String amountABp;
  final String amountABm;
  final String amountOp;
  final String amountOm;
  final String bloodGAp;
  final String bloodGAm;
  final String bloodGBp;
  final String bloodGBm;
  final String bloodGABp;
  final String bloodGABm;
  final String bloodGOp;
  final String bloodGOm;
  final String id;

  AllBloodModel({
    required this.id,
    required this.amountAp,
    required this.amountAm,
    required this.amountBp,
    required this.amountBm,
    required this.amountABp,
    required this.amountABm,
    required this.amountOp,
    required this.amountOm,
    required this.bloodGAp,
    required this.bloodGAm,
    required this.bloodGBp,
    required this.bloodGBm,
    required this.bloodGABp,
    required this.bloodGABm,
    required this.bloodGOp,
    required this.bloodGOm,
  });

  static AllBloodModel fromJson(Map<String, dynamic> json) => AllBloodModel(
        amountAp: json['amountAp'],
        amountAm: json['amountAm'],
        amountBp: json['amountBp'],
        amountBm: json['amountBm'],
        amountABp: json['amountABp'],
        amountABm: json['amountABm'],
        amountOp: json['amountOp'],
        amountOm: json['amountOm'],
        bloodGAp: json['bloodGAp'],
        bloodGAm: json['bloodGAm'],
        bloodGBp: json['bloodGBp'],
        bloodGBm: json['bloodGBm'],
        bloodGABp: json['bloodGABp'],
        bloodGABm: json['bloodGABm'],
        bloodGOp: json['bloodGOp'],
        bloodGOm: json['bloodGOm'],
        id: json['id'],
      );
}
