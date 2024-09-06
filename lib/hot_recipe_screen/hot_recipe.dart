import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_app/menu_screen/menu.dart';
import 'package:first_app/wet_1screen/wet1.dart';

void onTapLeftIcon(BuildContext context) {
  // 左のアイコンがタップされたときの処理
  print('left iconがタップされました');
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const MenuScreen(),
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
          const WettingthefilterScreen(),
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

class HotRecipScreen extends StatelessWidget {
  const HotRecipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
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
                'Hot Coffee',
                style: TextStyle(
                  fontSize: screenWidth * 0.1,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                'recipe',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(13, 0),
                    child: SizedBox(
                      width: screenWidth * 0.95,
                      height: screenHeight * 0.2951,
                      child: SvgPicture.asset(
                        'assets/images/hot.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.11,
                    top: screenHeight * 0.068,
                    child: Text(
                      'Hot water',
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.05,
                    bottom: screenHeight * 0.0773,
                    child: Text(
                      'Ground coffee',
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                '<Ingredient>',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Hot Water',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                'Ground Coffee 16g',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.0702),
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
