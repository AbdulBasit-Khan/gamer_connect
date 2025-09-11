import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Helper {
  static showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (BuildContext context) {
        return const Center(
          child: SpinKitFadingCube(color: Colors.blue, size: 50.0),
        );
      },
    );
  }
}
