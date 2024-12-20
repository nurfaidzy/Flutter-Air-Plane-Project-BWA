// ignore_for_file: camel_case_types

import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/models/checkout_model.dart';
import 'package:air_plane/models/places_model.dart';
import 'package:air_plane/services/checkout_service.dart';
import 'package:air_plane/services/places_service.dart';
import 'package:air_plane/ui/pages/success_checkout.dart';
import 'package:air_plane/ui/widgets/custom_button.dart';
import 'package:air_plane/ui/widgets/destination_tile.dart';
import 'package:air_plane/ui/widgets/moneySparator.dart';
import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class checkoutPage extends StatelessWidget {
  final int idDestination;
  final List<String> selectedSeats;
  final int price;
  final int grandTotal;
  const checkoutPage({
    super.key,
    required this.idDestination,
    required this.selectedSeats,
    required this.price,
    required this.grandTotal,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageHeader() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 350,
              height: 110,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image_checkout.png"),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget initialPlace() {
      return Container(
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CGK",
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Tanggerang",
                      style: blackTextStyle.copyWith(
                          fontWeight: light, color: kGreyColor),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "TLC",
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text("Ciliwung",
                      style: blackTextStyle.copyWith(
                          fontWeight: light, color: kGreyColor))
                ],
              )
            ])
          ],
        ),
      );
    }

    Widget detailItem(
        {required String title, required String value, required Color color}) {
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

    String cleanTextSeat(String text) {
      return text.replaceAll("[", "").replaceAll("]", "");
    }

    Widget bookingDetail() {
      return Column(
        children: [
          detailItem(
              title: "Traveler",
              value: "${selectedSeats.length} person",
              color: kBlackColor),
          detailItem(
              title: "Seat",
              value: cleanTextSeat(selectedSeats.toString()),
              color: kBlackColor),
          detailItem(title: "Insurance", value: "YES", color: kGreenColor),
          detailItem(title: "Refundable", value: "NO", color: kRedColor),
          detailItem(title: "VAT", value: "45%", color: kBlackColor),
          detailItem(
              title: "Price",
              value: "IDR ${moneySeparator(price)}",
              color: kBlackColor),
          detailItem(
              title: "Grand Total",
              value: "IDR ${moneySeparator(price * selectedSeats.length)}",
              color: kPrimaryColor),
        ],
      );
    }

    Widget boxDetailPayment() {
      return Container(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: FutureBuilder<PlacesModel>(
                future: PlacesService().getPlaceById(idDestination),
                builder: (context, snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      destinationTile(
                        imageUrl: snapshot.data?.image ??
                            "assets/icon_unavailable.png",
                        namePlace: snapshot.data?.name ?? "",
                        locationPlace: snapshot.data?.city ?? "",
                        stars: "4.8",
                        id: snapshot.data?.id ?? 0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text("Booking Details",
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            )),
                      ),
                      bookingDetail(),
                    ],
                  );
                }),
          ),
        ),
      );
    }

    Widget paymentDetails() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Container(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Payment Details",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                )),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 70,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image_card.png"),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icon_plane.png"),
                            ),
                          ),
                        ),
                        Text("Pay",
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ))
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("IDR 80.400.000",
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          )),
                      Text("Current Balance",
                          style: greyTextStyle.copyWith(
                            fontWeight: light,
                          )),
                    ],
                  ),
                )
              ],
            )
          ]),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: [
              imageHeader(),
              initialPlace(),
              boxDetailPayment(),
              paymentDetails(),
              CustomButton(
                title: "Pay Now",
                onPressed: () async {
                  try {
                    await CheckoutService().setCheckout(CheckoutModel(
                      id: "",
                      userId: state is AuthSuccess ? state.user.id : '',
                      idDestination: idDestination,
                      totalTraveler: selectedSeats.length,
                      selectedSeats: selectedSeats,
                      insurance: true,
                      refundable: false,
                      vat: 45,
                      price: price,
                      grandTotal: price * selectedSeats.length,
                    ));
                    // Navigate to Success Page if successful
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SuccessCheckout();
                    }));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              "Failed to process checkout. Please try again.")),
                    );
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Center(
                  child: Text("Terms and Conditions",
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                        decoration: TextDecoration.underline,
                      )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
