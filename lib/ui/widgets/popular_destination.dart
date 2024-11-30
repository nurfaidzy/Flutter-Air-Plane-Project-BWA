import 'package:air_plane/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';
import 'dart:convert';

class PopularDestination extends StatelessWidget {
  final String imageUrl;
  final String stars;
  final String name;
  final String city;
  final int id;
  const PopularDestination({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.stars,
    required this.name,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detailPage(
                      id: id,
                    )));
      },
      child: Container(
        width: 200,
        height: 323,
        margin: EdgeInsets.only(left: defaultMargin),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 180,
                height: 220,
                margin: const EdgeInsets.only(bottom: 20),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        child: Image.memory(
                          base64Decode(
                              imageUrl.split(',').last), // Decode Base64 string
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                  Icons.broken_image), // Handle decoding errors
                        )),
                    Container(
                      width: 55,
                      height: 30,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            defaultRadius,
                          ),
                        ),
                      ),
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
                )),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    city,
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
