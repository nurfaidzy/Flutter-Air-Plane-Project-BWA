import "package:air_plane/cubit/auth_cubit.dart";
import "package:air_plane/cubit/pages_cubit.dart";
import "package:air_plane/ui/pages/bonus_page.dart";
import "package:air_plane/ui/pages/get_started_page.dart";
import "package:air_plane/ui/pages/main_page.dart";
import "package:air_plane/ui/pages/sign_up_page.dart";
import "package:air_plane/ui/pages/splash_page.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PagesCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const SplashPage(),
          "/get-started": (context) => const getStartedPage(),
          "/sign-up": (context) => SignUpPage(),
          "/bonus": (context) => const BonusPage(),
          "/main": (context) => const MainPage(),
        },
      ),
    );
  }
}
