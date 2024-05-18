import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/loader.json',
        fit: BoxFit.cover,
        height: 100,
        width: 100,
        repeat: true,
      ),
    );
  }
}
