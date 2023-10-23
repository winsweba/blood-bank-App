import 'package:flutter/material.dart';

class HELP extends MaterialPageRoute<Null> {
  HELP()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('Help'),
              elevation: 5.0,
              centerTitle: true,
            ),
            body: const SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Card(
                      elevation: 20,
                      clipBehavior: Clip.hardEdge,
                      child: SizedBox(
                        width: 300,
                        // height: 580,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // const SizedBox(
                              //   height: 18,
                              // ),
                              // Container(
                              //   height: 280,
                              //   width: 280,
                              //   decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.circular(12),
                              //     image: const DecorationImage(
                              //         image: AssetImage('assets/IMG.jpg'),
                              //         fit: BoxFit.fill),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 12,
                              // ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      "{confidence.toStringAsFixed(0)}% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // getImageCamera();
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 30.0, vertical: 10.0),
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(13.0)),
                    //     foregroundColor: Colors.white,
                    //   ),
                    //   child: const Text(
                    //     "Take a photo",
                    //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // getImageGallery();
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 30.0, vertical: 10.0),
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(13.0)),
                    //     foregroundColor: Colors.white,
                    //   ),
                    //   child: const Text(
                    //     "pick from gallery",
                    //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                  ],
                ),
              ),
            ),
          );
        });
}
