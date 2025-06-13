import 'package:flutter/material.dart';
import 'package:one_cask/pallete.dart';
import 'package:one_cask/presentation/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Center(
        child: SizedBox(
          height: 150,
          child: Image(
            image: AssetImage('assets/images/one_cask_logo.png'),
          ),
        ),
      ),
    );
  }
}
