import 'package:firstprojectofflutterui/pages/app_main_screen.dart';
import 'package:firstprojectofflutterui/widgets/common_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
              child: Image.asset(
                'assets/images/bg.png',
                height: size.height / 1.3,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 45,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Fall in Love with Caffe i n Blissful Delight!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Welcome to our coffee shop, where every sip is a delightful escape to the world of flavors and aromas.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CommonButton(
                        title: 'Get Started',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CoffeeAppMainScreen()));
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
