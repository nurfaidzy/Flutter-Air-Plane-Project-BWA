// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:air_plane/models/places_model.dart';
import 'package:air_plane/services/places_service.dart';
import 'package:air_plane/ui/pages/choose_seat_page.dart';
import 'package:air_plane/ui/widgets/custom_button.dart';
import 'package:air_plane/ui/widgets/moneySparator.dart';
import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';

class detailPage extends StatelessWidget {
  final int id;
  detailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Widget backGroundImage({required String image}) {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: MemoryImage(
              base64Decode(image.split(',').last),
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget photoSection({
      required String image,
    }) {
      return Container(
        width: 70,
        height: 70,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: MemoryImage(
              base64Decode(image.split(',').last),
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget customShaddow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.95),
              ]),
        ),
      );
    }

    Widget customChecklis({
      required String title,
    }) {
      return Row(
        children: [
          Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(right: 2),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/icon_check.png"),
              ),
            ),
          ),
          Text(title,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              )),
        ],
      );
    }

    List<Widget> _buildInterestColumns(List<String> interest,
        {int numColumns = 2}) {
      // Initialize a list to hold the interests for each column
      List<List<String>> columnsData = List.generate(numColumns, (_) => []);

      // Distribute interests into columns in a round-robin fashion
      for (int i = 0; i < interest.length; i++) {
        columnsData[i % numColumns].add(interest[i]);
      }

      // Build the columns wrapped in Expanded widgets
      return columnsData.map((columnInterests) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < columnInterests.length; i++) ...[
                customChecklis(title: columnInterests[i]),
                if (i < columnInterests.length - 1) const SizedBox(height: 10),
              ],
            ],
          ),
        );
      }).toList();
    }

    Widget Content({
      required String name,
      required String city,
      required String stars,
      required String about,
      required List<String> photos,
      required List<String> interest,
      required String price,
    }) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            Container(
              width: 108,
              height: 24,
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icon_emblem.png"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          city,
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(right: 2),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icon_star.png"),
                          ),
                        ),
                      ),
                      Text(
                        stars,
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    about,
                    style: blackTextStyle.copyWith(
                      fontWeight: regular,
                      // interface use by iphone 16 layout make space so far
                      height: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Photos",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: photos
                        .take(3)
                        .map((photo) => photoSection(image: photo))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Interest",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _buildInterestColumns(interest, numColumns: 2),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "IDR ${moneySeparator(int.parse(price))}",
                                      style: blackTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: medium,
                                      )),
                                  Text("per orang",
                                      style: greyTextStyle.copyWith(
                                        fontSize: 14,
                                      )),
                                ]),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(),
                          child: CustomButton(
                            title: "Book Now",
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChooseSeatPage(
                                            id: id,
                                            price: int.parse(price),
                                          )));
                            },
                            width: 170,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: FutureBuilder<PlacesModel>(
          future: PlacesService().getPlaceById(id.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the future is loading, show a loading indicator
              return Container(
                margin: const EdgeInsets.only(top: 500),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasError) {
              // If there is an error, display an error message
              return Center(
                child: Text('An error occurred: ${snapshot.error}'),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              // When data is available, build the UI
              return Stack(
                children: [
                  backGroundImage(image: snapshot.data!.image),
                  customShaddow(),
                  Content(
                    name: snapshot.data!.name,
                    city: snapshot.data!.city,
                    stars: snapshot.data!.rating.toString(),
                    about: snapshot.data!.about,
                    photos: snapshot.data!.photos,
                    interest: snapshot.data!.interest,
                    price: snapshot.data!.price.toString(),
                  ),
                ],
              );
            } else {
              // Handle the case when there's no data
              return const Center(
                child: Text('No data found'),
              );
            }
          },
        ),
      ),
    );
  }
}
