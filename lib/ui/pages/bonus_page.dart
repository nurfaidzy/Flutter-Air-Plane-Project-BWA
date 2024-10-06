import 'package:air_plane/shared/theme.dart';
import 'package:flutter/material.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({super.key});

  Widget BonusCard() {
    return Container(
      width: 300,
      height: 211,
      padding: EdgeInsets.all(
        defaultMargin,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/image_card.png"),
        ),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.5),
            blurRadius: 50,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name",
                        style: whiteTextStyle.copyWith(fontWeight: light)),
                    Text("Kazzie Anne",
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 20)),
                  ],
                ),
              ),
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 6),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon_plane.png"),
                  ),
                ),
              ),
              Text(
                "Pay",
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 41,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Balance",
              style: whiteTextStyle.copyWith(
                fontWeight: light,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "IDR 280.000.000",
              style: whiteTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleBalance() {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      child: Text(
        "Big Bonus 🎉",
        style: blackTextStyle.copyWith(
          fontSize: 32,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget subTitleBalance() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        "We give you early credit so that\nyou can buy a flight ticket",
        style: greyTextStyle.copyWith(
          fontSize: 16,
          fontWeight: light,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget ButtonStart() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      width: 220,
      height: 55,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        child: Text(
          "Start Fly Now",
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BonusCard(),
          titleBalance(),
          subTitleBalance(),
          ButtonStart()
        ],
      )),
    );
  }
}
