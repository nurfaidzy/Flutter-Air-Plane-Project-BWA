// ignore_for_file: non_constant_identifier_names

import 'package:air_plane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import "../../shared//theme.dart";

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Join us and get\nyour next journey",
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
        ],
      );
    }

    Widget FormSignUp() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Full Name",
            "Email Address",
            "Password",
            "Hobby",
            "SignUp",
          ].map<Widget>((e) {
            if (e == "SignUp") {
              // return CustomButton(
              //   title: "Get Started",
              //   onPressed: () {
              //     Navigator.pushNamed(context, "/bonus");
              //   },
              // );
              return Center(
                child: CustomButton(
                  title: "Get Started",
                  onPressed: () {
                    Navigator.pushNamed(context, "/bonus");
                  },
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    obscureText: e == "Password" ? true : false,
                    decoration: InputDecoration(
                      hintText: e,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            }
          }).toList(),
        ),
      );
    }

    Widget termsAndConditions() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Center(
          child: Text(
            "Terms and Conditions",
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: ListView(
            children: [
              title(),
              FormSignUp(),
              termsAndConditions(),
            ],
          ),
        ),
      ),
    );
  }
}
