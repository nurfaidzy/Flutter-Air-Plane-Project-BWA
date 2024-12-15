import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:air_plane/ui/widgets/moneySparator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  Widget bonusCard() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
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
                        Text(state is AuthSuccess ? (state).user.name : "",
                            style: whiteTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: medium,
                            )),
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
                  state is AuthSuccess
                      ? "Rp. ${moneySeparator((state).user.balance as int)}"
                      : "0",
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 26,
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
          bonusCard(),
        ],
      )),
    );
  }
}
