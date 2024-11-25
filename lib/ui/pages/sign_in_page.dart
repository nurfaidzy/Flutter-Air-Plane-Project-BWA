// ignore_for_file: non_constant_identifier_names

import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "../../shared//theme.dart";

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController(
    text: "",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "",
  );

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign in with your\nexisting account",
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
        ],
      );
    }

    Widget FormSignIn() {
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
            "Email Address",
            "Password",
            "SignIn",
          ].map<Widget>((e) {
            if (e == "SignIn") {
              return Center(
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/main", (route) => false);
                    } else if (state is AuthFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kRedColor,
                          content: Text(
                            state.error,
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is authLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return CustomButton(
                      title: "Sign In",
                      onPressed: () {
                        context.read<AuthCubit>().signIn(
                            email: emailController.text,
                            password: passwordController.text);
                      },
                    );
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
                    controller: e == "Email Address"
                        ? emailController
                        : passwordController,
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

    Widget SignUpButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Center(
            child: Text(
              "Create New Account",
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
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
              FormSignIn(),
              SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}
