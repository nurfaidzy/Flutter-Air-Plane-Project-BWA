import 'package:air_plane/cubit/seat_cubit.dart';
import 'package:air_plane/ui/pages/checkout_page.dart';
import 'package:air_plane/ui/widgets/custom_button.dart';
import 'package:air_plane/ui/widgets/moneySparator.dart';
import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseSeatPage extends StatelessWidget {
  final int id;
  final int price;
  const ChooseSeatPage({
    super.key,
    required this.id,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 50,
        ),
        child: Text(
          "Select Your\nFavorite Seat",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget customIconSeat({
      required String imageUrl,
      required String title,
    }) {
      return Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6, left: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: regular,
            ),
          ),
        ],
      );
    }

    Widget statusSeat() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Row(
          children: [
            customIconSeat(
                imageUrl: "assets/icon_available.png", title: "Available"),
            customIconSeat(
                imageUrl: "assets/icon_selected.png", title: "Selected"),
            customIconSeat(
                imageUrl: "assets/icon_unavailable.png", title: "Unavailable"),
          ],
        ),
      );
    }

    Widget seatTitle(String title) {
      return Expanded(
        child: Center(
          child: Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget warpTitleSeat() {
      return Row(
        children: [
          seatTitle("A"),
          seatTitle("B"),
          seatTitle(""),
          seatTitle("D"),
          seatTitle("E"),
        ],
      );
    }

    Widget seatImage({
      required BuildContext context,
      required int position,
      required int rowSeat,
      required bool isAvailable,
      required bool isSelected,
    }) {
      Color colour;
      if (!isAvailable) {
        colour = const Color(0xFFEBECF1); // Unavailable color
      } else if (isSelected) {
        colour = const Color(0xFF5C40CC); // Selected color
      } else {
        colour = const Color(0xFFE0D9FF); // Available color
      }

      Color borderColour =
          isAvailable ? const Color(0xFF5C40CC) : const Color(0xFFEBECF1);

      return Expanded(
        child: Center(
          child: GestureDetector(
            onTap: isAvailable
                ? () => context.read<SeatCubit>().setSeat(rowSeat, position)
                : null,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: colour,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: borderColour,
                ),
              ),
              child: Center(
                child: isSelected
                    ? Text(
                        "You",
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
      );
    }

    Widget warpImageSeat({
      required int rowNumber,
      required Map<int, Map<String, bool>> seatData,
    }) {
      List<int?> positions = [1, 2, null, 3, 4];

      return Row(
        children: positions.map((position) {
          if (position == null) {
            return seatTitle(rowNumber.toString());
          } else {
            Map<String, bool> seatInfo = seatData[position]!;
            return seatImage(
              position: position,
              rowSeat: rowNumber,
              isAvailable: seatInfo["isAvailable"]!,
              isSelected: seatInfo["isSelected"]!,
              context: context,
            );
          }
        }).toList(),
      );
    }

    int countSelectedSeat(
      Map<int, Map<int, Seat>> state,
    ) {
      int count = 0;
      state.forEach((rowKey, seats) {
        seats.forEach((seatKey, seat) {
          if (seat.isSelected) {
            count++;
          }
        });
      });
      return count;
    }

    String yourSeat(
      Map<int, Map<int, Seat>> state,
    ) {
      List<String> seats = [];
      state.forEach((rowKey, rowSeats) {
        rowSeats.forEach((seatKey, seat) {
          if (seat.isSelected) {
            if (seatKey == 1) {
              seats.add("${rowKey}A");
            } else if (seatKey == 2) {
              seats.add("${rowKey}B");
            } else if (seatKey == 3) {
              seats.add("${rowKey}D");
            } else if (seatKey == 4) {
              seats.add("${rowKey}E");
            }
          }
        });
      });
      return seats.join(", ");
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, Map<int, Map<int, Seat>>>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Column(
              children: [
                warpTitleSeat(),
                ...state.entries.map((entry) => warpImageSeat(
                      rowNumber: entry.key,
                      seatData: entry.value
                          .map((seatNumber, seat) => MapEntry(seatNumber, {
                                "isAvailable": seat.isAvailable,
                                "isUnavailable": !seat.isAvailable,
                                "isSelected": seat.isSelected,
                              })),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 30,
                    ),
                    child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text("Your seat",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: light, color: kGreyColor))),
                          Text(yourSeat(state),
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text("data",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: light, color: kGreyColor))),
                          Text(
                              "IDR ${moneySeparator(price * countSelectedSeat(state))}",
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                color: kPrimaryColor,
                                fontWeight: semiBold,
                              ))
                        ],
                      ),
                    ]))
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          title(),
          statusSeat(),
          selectSeat(),
          CustomButton(
              title: "Continue to Checkout",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => checkoutPage(
                        idDestination: id,
                        price: price,
                        selectedSeats: yourSeat(context.read<SeatCubit>().state)
                            .split(", ")
                            .map((e) => e.toString())
                            .toList(),
                        grandTotal: price *
                            countSelectedSeat(context.read<SeatCubit>().state),
                      ),
                    ));
              }),
        ],
      ),
    );
  }
}
