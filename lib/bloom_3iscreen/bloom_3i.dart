import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:first_app/bloom_1iscreen/bloom_1i.dart';
import 'package:first_app/bloom_4iscreend/bloom_4i.dart';

void onTapLeftIcon(BuildContext context) {
  // 左のアイコンがタップされたときの処理
  print('left iconがタップされました');
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const BloomicedScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
        );
        return FadeTransition(
          opacity: curvedAnimation,
          child: child,
        );
      },
    ),
  );
}

void onTapRightIcon(BuildContext context) {
  // 右のアイコンがタップされたときの処理
  print('right iconがタップされました');
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const BloomicedScreenfourth(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
        );
        return FadeTransition(
          opacity: curvedAnimation,
          child: child,
        );
      },
    ),
  );
}

class BloomicedScreenthird extends StatefulWidget {
  const BloomicedScreenthird({Key? key}) : super(key: key);

  @override
  WettingthefilterScreenState createState() => WettingthefilterScreenState();
}

class WettingthefilterScreenState extends State<BloomicedScreenthird> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const BloomicedScreenfourth(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 2000),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            children: [
              Text('Bloom Coffee',
                  style: TextStyle(
                      fontSize: screenWidth * 0.1, color: Colors.white)),
              SizedBox(height: screenHeight * 0.0232),
              Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(0, 0), // 中心から13ピクセル右にずらす
                    child: SizedBox(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.4045,
                      child: SvgPicture.asset(
                        'assets/images/bloomiced3.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.234),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onTapLeftIcon(context);
                      },
                      child: Container(
                        width: screenWidth * 0.1,
                        height: screenHeight * 0.08,
                        child: SvgPicture.asset(
                          'assets/icon/left.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onTapRightIcon(context);
                      },
                      child: Container(
                        width: screenWidth * 0.1,
                        height: screenHeight * 0.08,
                        child: SvgPicture.asset(
                          'assets/icon/right.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
