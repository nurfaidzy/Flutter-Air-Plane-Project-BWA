import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:air_plane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/sign-up", (route) => false);
        }
      },
      builder: (context, state) {
        if (state is authLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          child: Center(
            child: CustomButton(
              title: "Sign Out",
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
              width: 220,
            ),
          ),
        );
      },
    );
  }
}
