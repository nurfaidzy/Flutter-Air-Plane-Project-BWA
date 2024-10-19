// ignore_for_file: camel_case_types

import "package:air_plane/ui/widgets/custom_button.dart";
import "package:flutter/material.dart";
import "../../shared//theme.dart";

class getStartedPage extends StatelessWidget {
  const getStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image_get_started.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Fly like a bird",
                style: whiteTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Explore new world with us and let\nyourself get an amazing experiences",
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 50,
                ),
                child: CustomButton(
                  title: "Get Started",
                  onPressed: () {
                    Navigator.pushNamed(context, "/sign-up");
                  },
                  width: 220,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
