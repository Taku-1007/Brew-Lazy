import 'dart:async';
import 'package:flutter/material.dart';

class TimerRectangle extends StatefulWidget {
  const TimerRectangle({Key? key}) : super(key: key);

  @override
  TimerRectangleState createState() => TimerRectangleState();
}

class TimerRectangleState extends State<TimerRectangle> {
  int _seconds = 20;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = _seconds / 20.0;
    double containerWidth = MediaQuery.of(context).size.width * 0.6977;
    MediaQuery.of(context).size.width * 00.8;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height; // デバイス幅の80%を使用
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('<$_seconds>',
              style:
                  TextStyle(fontSize: screenWidth * 0.08, color: Colors.white)),
          SizedBox(height: screenHeight * 0.02),
          Container(
            width: containerWidth,
            height: screenHeight * 0.035,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: screenHeight * 0.005),
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Container(
                    width: containerWidth * progress,
                    height: screenHeight * 0.0832,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
