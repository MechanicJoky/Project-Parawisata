import 'package:flutter/material.dart';
import 'package:project_pariwisata/view/splashscreen.dart';

void main() {
  runApp(const ExploraTrip());
}

class ExploraTrip extends StatelessWidget {
  const ExploraTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
// original
