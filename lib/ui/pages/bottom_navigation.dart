import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.imageUrl,
    required this.isActive,
  });

  final String imageUrl;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
            color: isActive ? kPrimaryColor : kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
        )
      ],
    );
  }
}
