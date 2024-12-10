import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/models/places_model.dart';
import 'package:air_plane/services/checkout_service.dart';
import 'package:air_plane/services/places_service.dart';
import 'package:air_plane/ui/widgets/destination_tile.dart';
import 'package:air_plane/ui/widgets/item_payment.dart';
import 'package:air_plane/ui/widgets/moneySparator.dart';
import 'package:flutter/material.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranscationPage extends StatelessWidget {
  const TranscationPage({super.key});

  @override
  Widget build(BuildContext context) {
    String cleanTextSeat(String text) {
      return text.replaceAll("[", "").replaceAll("]", "");
    }

    Widget bookingDetail({
      required selectedSeats,
      required price,
    }) {
      return Column(
        children: [
          DetailItem(
              title: "Traveler",
              value: "${selectedSeats.length} person",
              color: kBlackColor),
          DetailItem(
              title: "Seat",
              value: cleanTextSeat(selectedSeats.toString()),
              color: kBlackColor),
          DetailItem(title: "Insurance", value: "YES", color: kGreenColor),
          DetailItem(title: "Refundable", value: "NO", color: kRedColor),
          DetailItem(title: "VAT", value: "45%", color: kBlackColor),
          DetailItem(
              title: "Price",
              value: "IDR ${moneySeparator(price)}",
              color: kBlackColor),
          DetailItem(
              title: "Grand Total",
              value: "IDR ${moneySeparator(price * selectedSeats.length)}",
              color: kPrimaryColor),
        ],
      );
    }

    Widget boxDetailPayment({
      required idDestination,
      required selectedSeats,
      required price,
      required grandTotal,
    }) {
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
                      bookingDetail(price: price, selectedSeats: selectedSeats),
                    ],
                  );
                }),
          ),
        ),
      );
    }

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return FutureBuilder(
          future: CheckoutService()
              .getCheckoutsByUserId(state is AuthSuccess ? state.user.id : ''),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Something went wrong: ${snapshot.error}");
            } else if (!snapshot.hasData) {
              // No data returned
              return const Text("No Data");
            } else {
              // We have data!
              var data = snapshot.data;
              return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 400,
                    height: 500,
                    child: boxDetailPayment(
                      idDestination: data?[index].idDestination,
                      selectedSeats: data?[index].selectedSeats,
                      price: data?[index].price,
                      grandTotal: data?[index].grandTotal,
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}
