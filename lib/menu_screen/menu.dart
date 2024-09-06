import 'package:flutter/material.dart';
import 'package:first_app/hot_recipe_screen/hot_recipe.dart';
import 'package:first_app/iced_recipe_screen/iced_recipe.dart';



class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  void onTapTxtHotCoffee(BuildContext context) {
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

  void onTapTxtIcedCoffee(BuildContext context) {
    print('left iconがタップされました');
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const IcedRecipScreen(),
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

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
   
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Container(
          color: Colors.black,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            children: [
              Text(
                'Menu',
                style: TextStyle(
                  fontSize: screenWidth * 0.1,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenWidth * 0.4097),
              GestureDetector(
                onTap: () {
                  onTapTxtHotCoffee(context);
                },
                child: Text(
                  'Hot Coffee',
                  style: TextStyle(
                      fontSize: screenWidth * 0.12, color: Colors.white),
                ),
              ),
              SizedBox(height: screenWidth * 0.2),
              GestureDetector(
                onTap: () {
                  onTapTxtIcedCoffee(context);
                },
                child: Text(
                  'Iced Coffee',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: screenWidth * 0.12, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
