// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'dart:convert';

import 'package:air_plane/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';

class destinationTile extends StatelessWidget {
  final String imageUrl;
  final String namePlace;
  final String locationPlace;
  final String stars;
  final int id;
  const destinationTile({
    required this.imageUrl,
    required this.namePlace,
    required this.locationPlace,
    required this.stars,
    required this.id,
  });

  bool isBase64(String url) {
    return url.startsWith('data:image/');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => detailPage(
            id: id,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: isBase64(imageUrl)
                      ? MemoryImage(
                          base64Decode(imageUrl.split(',').last),
                        ) as ImageProvider<Object>
                      : AssetImage(imageUrl) as ImageProvider<Object>,
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
                Text(locationPlace,
                    style: greyTextStyle.copyWith(fontSize: 14)),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
      ),
    );
  }
}
