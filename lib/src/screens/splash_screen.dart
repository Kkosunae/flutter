import 'package:flutter/material.dart';
import 'package:kkosunae/src/screens/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: - Login check
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });

    return Container(
        color: const Color.fromRGBO(245, 245, 220, 1),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        )
    );
  }
}