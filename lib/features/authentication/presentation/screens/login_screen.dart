import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            CustomButton(onTap: () {}, child: Text("data")),
            SizedBox(
              height: 20,
            ),
            CustomButton(
                isPrimary: false,
                onTap: () {},
                child: CustomText(text: "Log In")),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: "Enter your email",
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              isPassword: true,
              hintText: "Enter your password",
            ),
          ],
        ),
      ),
    );
  }
}
