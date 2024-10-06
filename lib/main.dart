import "package:air_plane/ui/pages/bonus_page.dart";
import "package:air_plane/ui/pages/get_started_page.dart";
import "package:air_plane/ui/pages/sign_up_page.dart";
import "package:air_plane/ui/pages/splash_page.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SplashPage(),
        "/get-started": (context) => const getStartedPage(),
        "/sign-up": (context) => const SignUpPage(),
        "/bonus": (context) => const BonusPage(),
      },
    );
  }
}
