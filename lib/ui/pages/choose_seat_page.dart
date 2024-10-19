import 'package:air_plane/ui/pages/checkout_page.dart';
import 'package:air_plane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';

class choseSeatPage extends StatelessWidget {
  const choseSeatPage({super.key});

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
      bool isSelected = false,
      bool isAvailable = false,
      bool isUnavailable = false,
    }) {
      Color colour;
      if (isSelected) {
        colour = const Color(0xFF5C40CC);
      } else if (isAvailable) {
        colour = const Color(0xFFE0D9FF);
      } else if (isUnavailable) {
        colour = const Color(0xFFEBECF1);
      } else {
        colour =
            kBackgroundColor; // Add a default color if no condition matches
      }

      Color borderColour;
      if (isSelected || isAvailable) {
        borderColour = const Color(0xFF5C40CC);
      } else if (isUnavailable) {
        borderColour = const Color(0xFFEBECF1);
      } else {
        borderColour =
            kBackgroundColor; // Add a default color if no condition matches
      }

      return Expanded(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: colour,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: borderColour,
                )),
            child: Center(
              child: isSelected
                  ? Center(
                      // Conditionally display text only when isSelected is true
                      child: Text(
                        "You",
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      );
    }

    const mockSeatData = {
      1: {
        1: {
          "isAvailable": false,
          "isUnavailable": true,
          "isSelected": false,
        },
        2: {
          "isAvailable": false,
          "isUnavailable": true,
          "isSelected": false,
        },
        3: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": false,
        },
        4: {
          "isAvailable": false,
          "isUnavailable": true,
          "isSelected": false,
        },
      },
      2: {
        1: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": false,
        },
        2: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": false,
        },
        3: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": false,
        },
        4: {
          "isAvailable": false,
          "isUnavailable": true,
          "isSelected": false,
        },
      },
      3: {
        1: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": true,
        },
        2: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": true,
        },
        3: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": false,
        },
        4: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": false,
        },
      },
      4: {
        1: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": false,
        },
        2: {
          "isAvailable": false,
          "isUnavailable": true,
          "isSelected": false,
        },
        3: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": false,
        },
        4: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": false,
        },
      },
      5: {
        1: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": false,
        },
        2: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": false,
        },
        3: {
          "isAvailable": false,
          "isUnavailable": true,
          "isSelected": false,
        },
        4: {
          "isAvailable": true,
          "isUnavailable": false,
          "isSelected": false,
        },
      }
    };

    Widget warpImageSeat({
      required int rowNumber,
      required Map<int, Map<String, bool>> seatData,
    }) {
      return Row(
        children: [
          seatImage(
            isAvailable: seatData[1]!["isAvailable"]!,
            isUnavailable: seatData[1]!["isUnavailable"]!,
            isSelected: seatData[1]!["isSelected"]!,
          ),
          seatImage(
            isAvailable: seatData[2]!["isAvailable"]!,
            isUnavailable: seatData[2]!["isUnavailable"]!,
            isSelected: seatData[2]!["isSelected"]!,
          ),
          seatTitle(rowNumber.toString()),
          seatImage(
            isAvailable: seatData[3]!["isAvailable"]!,
            isUnavailable: seatData[3]!["isUnavailable"]!,
            isSelected: seatData[3]!["isSelected"]!,
          ),
          seatImage(
            isAvailable: seatData[4]!["isAvailable"]!,
            isUnavailable: seatData[4]!["isUnavailable"]!,
            isSelected: seatData[4]!["isSelected"]!,
          ),
        ],
      );
    }

    Widget selectSeat() {
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
            ...mockSeatData.entries.map((entry) => warpImageSeat(
                  rowNumber: entry.key,
                  seatData: entry.value,
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
                      Text("A3, B3",
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
                      Text("IDR 540.000.000",
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
                        builder: (context) => const checkoutPage()));
              })
        ],
      ),
    );
  }
}
