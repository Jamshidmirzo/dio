import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson81/blocs/auth/auth_bloc.dart';
import 'package:lesson81/data/models/user.dart';
import 'package:lesson81/ui/screens/verify_otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void submit() {
    final name = nameController.text;
    final phone = phoneController.text;
    final password = passwordController.text;

    context.read<AuthBloc>().add(RegisterEvent(
          name: name,
          phone: phone,
          password: password,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OTPVerificationState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) {
                return VerifyOtpScreen(state.optKey);
              },
            ),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone",
                ),
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
              FilledButton(
                onPressed: submit,
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
