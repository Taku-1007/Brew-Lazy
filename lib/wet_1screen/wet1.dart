import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_app/hot_recipe_screen/hot_recipe.dart';
import 'package:first_app/wet_2screen/wet_2.dart';
import 'dart:async';

void onTapLeftIcon(BuildContext context) {
  print('left iconがタップされました');
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const HotRecipScreen(),
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
  print('right iconがタップされました');
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

class WettingthefilterScreen extends StatefulWidget {
  const WettingthefilterScreen({Key? key}) : super(key: key);

  @override
  WettingthefilterScreenState createState() => WettingthefilterScreenState();
}

class WettingthefilterScreenState extends State<WettingthefilterScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const WettingthefilterScreensecond(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 1000),
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
          width: double.infinity,
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
              SizedBox(height: screenHeight * 0.0232),
              Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0, 0),
                    child: SizedBox(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.4045,
                      child: SvgPicture.asset(
                        'assets/images/wet1.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                '<Direction>',
                style: TextStyle(
                    fontSize: screenWidth * 0.08, color: Colors.white),
              ),
              SizedBox(height: screenHeight * 0.02),
              Column(
                children: [
                  Text(
                    'Pour an appropriate amount of hot',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenWidth * 0.05, color: Colors.white),
                  ),
                  Text(
                    'water into the filter to moisten the',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenWidth * 0.05, color: Colors.white),
                  ),
                  Text(
                    'entire filter and remove any water ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenWidth * 0.05, color: Colors.white),
                  ),
                  Text(
                    'that has fallen.',
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
