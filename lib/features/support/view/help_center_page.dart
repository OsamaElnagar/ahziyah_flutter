import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (!await launchUrl(launchUri)) {
      throw Exception('Could not launch $launchUri');
    }
  }

  Future<void> _sendEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Support Request&body=Hello, I need help with...',
    );
    if (!await launchUrl(launchUri)) {
      throw Exception('Could not launch $launchUri');
    }
  }

  Future<void> _openWhatsApp(String phoneNumber) async {
    // Remove any non-numeric characters from the phone number
    String formattedNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    final Uri whatsappUri = Uri.parse(
      'https://wa.me/$formattedNumber?text=Hello, I need help with...',
    );

    if (!await launchUrl(whatsappUri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/Help_lightTheme.png',
                  width: Get.width / 1.5,
                ),
              ),
              Text(
                'We are here to help\nSo please get in touch with us.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Divider(),
              InkWell(
                onTap: () => _makePhoneCall('+201094157080'),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Theme.of(context).dividerColor,
                        child: Icon(Icons.phone),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone Number',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text('+201094157080 - Vodafone Egyptian lines'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () => _openWhatsApp('+201094157080'),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Theme.of(context).dividerColor,
                        child: Icon(
                          IconlyLight.chat,
                          // color: Color(0xFF25D366), // WhatsApp green color
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WhatsApp',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text('Chat with us on WhatsApp'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () => _sendEmail('osamaelngar98@gmail.com'),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Theme.of(context).dividerColor,
                        child: Icon(Icons.email_rounded),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-mail address',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text('osamaelngar98@gmail.com'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
