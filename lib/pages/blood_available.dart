// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/all_blood.dart';

// import 'package:flutter_svg/flutter_svg.dart';

class BloodAvailable extends StatefulWidget {
  const BloodAvailable({super.key});

  @override
  State<StatefulWidget> createState() => BloodAvailableState();
}

class BloodAvailableState extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<AllBloodModel>>(
        stream: getAllReport(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var tSnapshot = snapshot.data![index];
                var ap = double.parse(tSnapshot.amountAp);
                var am = double.parse(tSnapshot.amountAm);
                var bp = double.parse(tSnapshot.amountBp);
                var bm = double.parse(tSnapshot.amountBm);
                var abp = double.parse(tSnapshot.amountABp);
                var abm = double.parse(tSnapshot.amountABm);
                var op = double.parse(tSnapshot.amountOp);
                var om = double.parse(tSnapshot.amountOm);
                return Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.3,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndex = -1;
                                    return;
                                  }
                                  touchedIndex = pieTouchResponse
                                      .touchedSection!.touchedSectionIndex;
                                });
                              },
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 0,
                            sections: showingSections(
                                ap, am, bp, bm, abp, abm, op, om),
                          ),
                        ),
                      ),
                    ),
                    // Text("V"),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Group ${tSnapshot.bloodGAp} :-   ${tSnapshot.amountAp} Unit",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Group ${tSnapshot.bloodGAm} :-   ${tSnapshot.amountAm} Unit",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Group ${tSnapshot.bloodGBp} :-   ${tSnapshot.amountBp} Unit",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Group ${tSnapshot.bloodGBm} :-   ${tSnapshot.amountBm} Unit",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Group ${tSnapshot.bloodGABp} :-   ${tSnapshot.amountABp} Unit",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Group ${tSnapshot.bloodGABm} :-   ${tSnapshot.amountABm} Unit",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Group ${tSnapshot.bloodGOp} :-   ${tSnapshot.amountOp} Unit",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Group ${tSnapshot.bloodGOm} :-   ${tSnapshot.amountOm} Unit",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        // TextButton(
                        //   style: ButtonStyle(
                        //     foregroundColor:
                        //         MaterialStateProperty.all<Color>(Colors.blue),
                        //   ),
                        //   onPressed: () {
                        //     // Navigator.of(context).push(
                        //     //   MaterialPageRoute(
                        //     //     builder: (context) => DonorDetailsPage(
                        //     //       title: "Donor Details",
                        //     //       donorAge: tSnapshot.donorAge,
                        //     //       donorLocation: tSnapshot.donorLocation,
                        //     //       donorName: tSnapshot.donorName,
                        //     //       donorPhone: tSnapshot.donorPhone,
                        //     //       locationLat: tSnapshot.locationLat,
                        //     //       locationLong: tSnapshot.locationLong,
                        //     //       gender: tSnapshot.gender,
                        //     //       timestamp: tSnapshot.timestamp,
                        //     //       bloodGroup: tSnapshot.bloodGroup,
                        //     //     ),
                        //     //   ),
                        //     // );
                        //     // Navigator.of(context).push(
                        //     //   MaterialPageRoute(
                        //     //     builder: (context) => EditAvailableDetailsPage(
                        //     //       amountAp: tSnapshot.amountAp,
                        //     //       amountAm: tSnapshot.amountAm,
                        //     //       amountBp: tSnapshot.amountBp,
                        //     //       amountBm: tSnapshot.amountBm,
                        //     //       amountABp: tSnapshot.amountABp,
                        //     //       amountABm: tSnapshot.amountABm,
                        //     //       amountOp: tSnapshot.amountOp,
                        //     //       amountOm: tSnapshot.amountOm,
                        //     //       id: tSnapshot.id,
                        //     //     ),
                        //     //   ),
                        //     // );
                        //   },
                        //   child: const Text(
                        //     'Make Update',
                        //     style: TextStyle(fontSize: 18),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  List<PieChartSectionData> showingSections(
    double ap,
    double am,
    double bp,
    double bm,
    double abp,
    double abm,
    double op,
    double om,
  ) {
    return List.generate(8, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blueAccent,
            value: ap,
            // title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'A+',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellowAccent,
            value: am,
            // title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'A-',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purpleAccent,
            value: bp,
            // title: '16%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'B+',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.greenAccent,
            value: bm,
            // title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'B-',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 4:
          return PieChartSectionData(
            color: Colors.deepOrange,
            value: abp,
            // title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'AB+',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 5:
          return PieChartSectionData(
            color: Color.fromARGB(255, 63, 23, 53),
            value: abm,
            // title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'AB-',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 6:
          return PieChartSectionData(
            color: Color.fromARGB(255, 223, 10, 10),
            value: op,
            // title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'O+',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 7:
          return PieChartSectionData(
            color: Color.fromARGB(255, 255, 166, 0),
            value: om,
            // title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'O-',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }

  Stream<List<AllBloodModel>> getAllReport() => FirebaseFirestore.instance
      .collection("availableBlood")
      // .orderBy("timestamp", descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => AllBloodModel.fromJson(doc.data()))
          .toList());
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.bloodG, {
    required this.size,
    required this.borderColor,
  });
  final String bloodG;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Text(
          bloodG,
        ),
        // child: SvgPicture.asset(
        //   svgAsset,
        // ),
      ),
    );
  }
}
