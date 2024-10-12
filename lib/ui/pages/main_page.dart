import 'package:air_plane/ui/pages/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                imageUrl: "assets/icon_home.png",
                isActive: false,
              ),
              BottomNavigation(
                imageUrl: "assets/icon_booking.png",
                isActive: false,
              ),
              BottomNavigation(
                imageUrl: "assets/icon_card.png",
                isActive: false,
              ),
              BottomNavigation(
                imageUrl: "assets/icon_settings.png",
                isActive: false,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            const Text("Home Page"),
            customBottomNavigation(),
          ],
        ));
  }
}
