import 'package:first_app/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_app/bloom_5iscreen/bloom_5i.dart';

void onTapLeftIcon(BuildContext context) {
  // 左のアイコンがタップされたときの処理
  print('left iconがタップされました');
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const BloomicedScreenfifth(),
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
          const HomeScreen(),
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

class IceddoneScreen extends StatelessWidget {
  const IceddoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
              Text(
                'Done',
                style: TextStyle(
                  fontSize: screenWidth * 0.1,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                'Enjoy your day ahead!',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(28, 0),
                    child: SizedBox(
                      width: screenWidth * 0.95,
                      height: screenHeight * 0.2951,
                      child: SvgPicture.asset(
                        'assets/images/iced_done.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.2337),
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
