import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson81/blocs/auth/auth_bloc.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String otpKey;
  const VerifyOtpScreen(this.otpKey, {super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final codeController = TextEditingController();

  void submit() {
    final code = codeController.text;

    context.read<AuthBloc>().add(
          VerifyOtpEvent(
            otpKey: widget.otpKey,
            otpCode: int.parse(code),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: codeController,
              decoration: const InputDecoration(
                labelText: "Code",
              ),
            ),
            FilledButton(
              onPressed: submit,
              child: const Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
