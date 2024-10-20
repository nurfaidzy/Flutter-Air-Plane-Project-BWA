import 'package:air_plane/cubit/pages_cubit.dart';
import 'package:air_plane/ui/pages/home_page.dart';
import 'package:air_plane/ui/pages/setting_page.dart';
import 'package:air_plane/ui/pages/transaction_page.dart';
import 'package:air_plane/ui/pages/wallet_page.dart';
import 'package:air_plane/ui/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TranscationPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            left: 24,
            right: defaultMargin,
            bottom: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavigation(
                index: 0,
                imageUrl: "assets/icon_home.png",
              ),
              BottomNavigation(
                index: 1,
                imageUrl: "assets/icon_booking.png",
              ),
              BottomNavigation(
                index: 2,
                imageUrl: "assets/icon_card.png",
              ),
              BottomNavigation(
                index: 3,
                imageUrl: "assets/icon_settings.png",
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PagesCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
            backgroundColor: kBackgroundColor,
            body: Stack(
              children: [
                buildContent(currentIndex),
                customBottomNavigation(),
              ],
            ));
      },
    );
  }
}
