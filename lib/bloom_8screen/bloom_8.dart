import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_app/bloom_5screen/bloom_5.dart';
import 'package:first_app/hot_done_screen/hot_done.dart';
import 'package:first_app/timer_20/timer20s.dart';

void onTapLeftIcon(BuildContext context) {
  // 左のアイコンがタップされたときの処理
  print('left iconがタップされました');
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const BloomScreenfifth(),
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
          const HotdoneScreen(),
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

class BloomScreeneighth extends StatelessWidget {
  const BloomScreeneighth({Key? key}) : super(key: key);

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
              SizedBox(height: screenHeight * 0.0521),

              // 正しいパスを指定してSVGを表示
              Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(0, 0), // 中心から13ピクセル右にずらす
                    child: SizedBox(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.3755,
                      child: SvgPicture.asset(
                        'assets/images/bloom8.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.0232),
              const TimerRectangle(),
              SizedBox(height: screenHeight * 0.103),

              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onTapLeftIcon(context);
                      },
                      child: SizedBox(
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
                      child: SizedBox(
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
