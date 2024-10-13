import 'package:air_plane/ui/widgets/popular_destination.dart';
import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget Header() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Howdy, \nKezia Anne",
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      )),
                  Text(
                    "Where to fly today?",
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/image_profile.png"),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget popularDestination() {
      return Container(
          margin: const EdgeInsets.only(top: 30),
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PopularDestination(
                  imageUrl: "assets/image_destination1.png",
                  name: "Lake Ciliwung",
                  city: "Tangerang",
                  stars: "4.8",
                ),
                PopularDestination(
                  imageUrl: "assets/image_destination2.png",
                  name: "White House",
                  city: "Spain",
                  stars: "4.7",
                ),
                PopularDestination(
                  imageUrl: "assets/image_destination3.png",
                  name: "Hill Heyo",
                  city: "Monaco",
                  stars: "4.8",
                ),
                PopularDestination(
                  imageUrl: "assets/image_destination4.png",
                  name: "Menarra",
                  city: "Japan",
                  stars: "4.7",
                ),
                PopularDestination(
                  imageUrl: "assets/image_destination5.png",
                  name: "Payung Teduh",
                  city: "Singapore",
                  stars: "4.8",
                ),
              ],
            ),
          ));
    }

    return ListView(
      children: [Header(), popularDestination()],
    );
  }
}
