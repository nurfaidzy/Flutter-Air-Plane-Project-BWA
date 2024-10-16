import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';

class destinationTile extends StatelessWidget {
  final String imageUrl;
  final String namePlace;
  final String locationPlace;
  final String stars;
  const destinationTile({
    required this.imageUrl,
    required this.namePlace,
    required this.locationPlace,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(namePlace,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  )),
              Text(locationPlace, style: greyTextStyle.copyWith(fontSize: 14)),
            ],
          ),
          Expanded(
            child: Row(
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
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
