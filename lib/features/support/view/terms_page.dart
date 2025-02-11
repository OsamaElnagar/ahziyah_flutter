import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Animated App Bar
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Terms & Conditions',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/terms.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Theme.of(context).scaffoldBackgroundColor,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    title: 'Welcome to AhziyaH',
                    content:
                        'By accessing and using our services, you agree to be bound by these terms and conditions. Please read them carefully before proceeding.',
                  ),
                  _buildSection(
                    title: '1. Acceptance of Terms',
                    content:
                        'By accessing and using AhziyaH\'s services, including our mobile application and website, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.',
                  ),
                  _buildSection(
                    title: '2. User Accounts',
                    content:
                        'When you create an account with us, you guarantee that the information you provide is accurate, complete, and current at all times. Inaccurate, incomplete, or obsolete information may result in the immediate termination of your account.',
                  ),
                  _buildSection(
                    title: '3. Product Information',
                    content:
                        'We strive to display our products and their features as accurately as possible. However, we do not guarantee that the colors, dimensions, and other product details will be displayed with complete accuracy.',
                  ),
                  _buildSection(
                    title: '4. Pricing and Payment',
                    content:
                        'All prices are subject to change without notice. We reserve the right to modify or discontinue any product without notice. We shall not be liable to you or any third party for any modification, price change, or discontinuance of any product.',
                  ),
                  _buildSection(
                    title: '5. Shipping and Delivery',
                    content:
                        'Delivery times are estimates only. We are not responsible for any delays caused by shipping carriers or customs procedures. Risk of loss and title for items purchased pass to you upon delivery of the items to the carrier.',
                  ),
                  _buildSection(
                    title: '6. Returns and Refunds',
                    content:
                        'Our return policy allows returns within 30 days of delivery. Items must be unused and in their original packaging. Refunds will be processed within 14 business days of receiving the returned item.',
                  ),
                  _buildSection(
                    title: '7. Privacy Policy',
                    content:
                        'Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and protect your personal information.',
                  ),
                  _buildSection(
                    title: '8. Intellectual Property',
                    content:
                        'All content included on this site, such as text, graphics, logos, images, and software, is the property of AhziyaH or its content suppliers and protected by international copyright laws.',
                  ),
                  _buildSection(
                    title: '9. Limitation of Liability',
                    content:
                        'AhziyaH shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your use of our services.',
                  ),
                  _buildSection(
                    title: '10. Changes to Terms',
                    content:
                        'We reserve the right to modify these terms at any time. We will notify users of any material changes via email or through our application.',
                  ),
                  const SizedBox(height: 32),
                  _buildContactSection(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Get.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Get.textTheme.bodyLarge?.copyWith(
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Questions about our Terms?',
            style: Get.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'If you have any questions about these Terms and Conditions, please contact our support team.',
            style: Get.textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Get.toNamed('/support'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Contact Support'),
          ),
        ],
      ),
    );
  }
}
