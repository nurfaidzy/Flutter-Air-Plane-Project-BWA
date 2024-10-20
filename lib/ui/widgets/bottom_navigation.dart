import 'package:air_plane/cubit/pages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.index,
    required this.imageUrl,
  });

  final String imageUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<PagesCubit>().state;

    Color colorSelector() {
      if (currentPage == index) {
        return kPrimaryColor;
      } else {
        return kGreyColor;
      }
    }

    return GestureDetector(
      onTap: () {
        context.read<PagesCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(imageUrl, width: 24, height: 24, color: colorSelector()),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: colorSelector(),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ],
      ),
    );
  }
}
