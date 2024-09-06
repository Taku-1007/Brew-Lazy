import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_app/wet_2screen/wet_2.dart';
import 'package:first_app/bloom_1screen/bloom_1.dart';

void onTapLeftIcon(BuildContext context) {
  // 左のアイコンがタップされたときの処理
  print('left iconがタップされました');
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const WettingthefilterScreensecond(),
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
          const BloomScreen(),
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

class WettingthefilterScreenthird extends StatelessWidget {
  const WettingthefilterScreenthird({Key? key}) : super(key: key);

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
                'Wetting the filter',
                style:
                    TextStyle(fontSize: screenWidth * 0.1, color: Colors.white),
              ),

              SizedBox(height: screenHeight * 0.1326),

              // 正しいパスを指定してSVGを表示
              Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(0, 0), // 中心から13ピクセル右にずらす
                    child: SizedBox(
                      width: screenWidth * 0.95,
                      height: screenHeight * 0.2951,
                      child: SvgPicture.asset(
                        'assets/images/wet3.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                '<Reason>',
                style: TextStyle(
                    fontSize: screenWidth * 0.08, color: Colors.white),
              ),
              SizedBox(height: screenHeight * 0.02),
              Column(
                children: [
                  Text(
                    'Water flows consistently',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenWidth * 0.05, color: Colors.white),
                  ),
                  Text(
                    'and efficiently through ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenWidth * 0.05, color: Colors.white),
                  ),
                  Text(
                    'ethe coffee grounds ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenWidth * 0.05, color: Colors.white),
                  ),
                  Text(
                    'extracting flavor evenly.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenWidth * 0.05, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.0097),

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
