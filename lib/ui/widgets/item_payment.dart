import 'package:air_plane/shared/theme.dart';
import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  const DetailItem({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: Row(children: [
              Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(right: 6),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon_check.png"),
                  ),
                ),
              ),
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontWeight: regular,
                ),
              ),
            ]),
          ),
          Text(
            value,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
