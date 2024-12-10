// ignore_for_file: non_constant_identifier_names

import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/models/places_model.dart';
import 'package:air_plane/services/places_service.dart';
import 'package:air_plane/ui/widgets/destination_tile.dart';
import 'package:air_plane/ui/widgets/popular_destination.dart';
import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget Header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
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
                      Text(
                          "How your day, \n${state is AuthSuccess ? (state as AuthSuccess).user.name : ""}",
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
        },
      );
    }

    Widget popularDestination() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: FutureBuilder<List<PlacesModel>>(
          future: PlacesService().getPlaces(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No destinations available'));
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: snapshot.data!.map((place) {
                    return PopularDestination(
                      id: place.id,
                      imageUrl: place.image,
                      name: place.name,
                      city: place.city,
                      stars: place.rating.toString(),
                    );
                  }).toList(),
                ),
              );
            }
          },
        ),
      );
    }

    Widget NewDestination() {
      return Container(
          margin: EdgeInsets.only(
              top: 30, left: defaultMargin, right: defaultMargin, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New This Year",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  )),
              const destinationTile(
                imageUrl: "assets/image_destination6.png",
                namePlace: "Danau Beratan",
                locationPlace: "Singaraja",
                stars: "4.8",
                id: 2,
              ),
              const destinationTile(
                imageUrl: "assets/image_destination7.png",
                namePlace: "Sydney Opera",
                locationPlace: "Australia",
                stars: "4.7",
                id: 3,
              ),
              const destinationTile(
                imageUrl: "assets/image_destination8.png",
                namePlace: "Roma",
                locationPlace: "Italy",
                stars: "4.8",
                id: 4,
              ),
              const destinationTile(
                imageUrl: "assets/image_destination9.png",
                namePlace: "Yogyakarta",
                locationPlace: "Indonesia",
                stars: "4.7",
                id: 5,
              ),
              const destinationTile(
                imageUrl: "assets/image_destination10.png",
                namePlace: "Paris",
                locationPlace: "France",
                stars: "4.8",
                id: 6,
              ),
            ],
          ));
    }

    return ListView(
      children: [Header(), popularDestination(), NewDestination()],
    );
  }
}
