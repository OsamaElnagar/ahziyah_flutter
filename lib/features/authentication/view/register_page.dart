import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_auth_field.dart';
import '../../../core/helpers/route_helper.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's get started!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Please enter your valid data in order to create an account.",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 32),
            CustomTextFormField(
              controller: emailController,
              hintText: "Email address",
              keyboardType: TextInputType.emailAddress,
              icon: Icons.email,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              icon: Icons.lock,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: false, // Manage this state as needed
                  onChanged: (value) {},
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "I agree with the ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: "Terms of service",
                          style: TextStyle(color: Colors.purple),
                        ),
                        TextSpan(
                          text: " & privacy policy.",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteHelper.getSetupProfileRoute());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
              child: const Text('Continue'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do you have an account?"),
                TextButton(
                  onPressed: () {
                    Get.offAllNamed(RouteHelper.getSignInRoute());
                  },
                  child: Text("Log in", style: TextStyle(color: Colors.purple)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
