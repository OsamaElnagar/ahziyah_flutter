import 'package:ahziyah_flutter/core/helpers/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/custom_auth_field.dart';

class SetupProfilePage extends StatelessWidget {
  const SetupProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fullNameController = TextEditingController();
    final dobController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("Setup Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // Handle info action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle image upload
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(8),
                      ),
                      child: Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 56),
            CustomTextFormField(
              controller: fullNameController,
              hintText: "Full name",
              keyboardType: TextInputType.name,
              icon: Icons.person,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              controller: dobController,
              hintText: "Date of birth",
              keyboardType: TextInputType.datetime,
              icon: Icons.calendar_today,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              controller: phoneController,
              hintText: "Phone number",
              keyboardType: TextInputType.phone,
              icon: Icons.phone,
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 30),
        child: Row(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey),
              ),
              onPressed: () {
                // Handle skip action
              },
              child: Text(
                "Skip",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(RouteHelper.getInitialRoute());
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("Sign up", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
