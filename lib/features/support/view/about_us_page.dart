import 'package:ahziyah_flutter/layout/controller/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(),

            // Timeline Section
            _buildTimelineSection(),

            // Stats Section
            _buildStatsSection(),

            // Values Section
            _buildValuesSection(),

            // CTA Section
            _buildCTASection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Stack(
      children: [
        // Background Image with Overlay
        SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/about/hero-bg.jpg',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.2),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.black.withOpacity(0.5)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  'Crafting Excellence\nSince 1985',
                  style: Get.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'From humble beginnings to industry leadership, our journey has been defined by innovation, quality, and an unwavering commitment to craftsmanship.',
                  style: Get.textTheme.titleLarge?.copyWith(
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineSection() {
    final timelineItems = [
      {
        'year': '1985',
        'title': 'The Beginning',
        'description': 'Founded in Dubai with a vision for excellence.',
        'image': 'assets/images/about/workshop.jpg',
      },
      {
        'year': '1995',
        'title': 'Global Expansion',
        'description': 'Expanded operations across multiple countries.',
        'image': 'assets/images/about/factory.jpg',
      },
      {
        'year': '2010',
        'title': 'Global Recognition',
        'description': 'AhziyaH became a globally recognized brand.',
        'image': 'assets/images/about/global.jpg',
      },
      {
        'year': '2024',
        'title': 'Sustainable Future',
        'description':
            'Leading the industry in sustainable manufacturing practices.',
        'image': 'assets/images/about/future.jpg',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          Text(
            'Our Journey',
            style: Get.textTheme.headlineMedium?.copyWith(
              // color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          ...timelineItems.map((item) => _buildTimelineItem(item)),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Row(
        children: [
          // Timeline line and dot
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    item['year']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: 2,
                height: 100,
                color: Colors.blue,
              ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title']!,
                  style: Get.textTheme.titleLarge?.copyWith(
                    // color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item['description']!,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item['image']!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    final stats = [
      {'value': '2M+', 'label': 'Pairs Sold Annually'},
      {'value': '50+', 'label': 'Countries'},
      {'value': '1.5K+', 'label': 'Employees'},
      {'value': '38+', 'label': 'Years of Excellence'},
    ];

    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(vertical: 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade900.withOpacity(0.2), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 40,
        runSpacing: 40,
        children: stats.map((stat) => _buildStatItem(stat)).toList(),
      ),
    );
  }

  Widget _buildStatItem(Map<String, String> stat) {
    return VisibilityDetector(
      key: Key(stat['label']!),
      onVisibilityChanged: (info) {
        // Add animation logic here
      },
      child: Column(
        children: [
          Text(
            stat['value']!,
            style: Get.textTheme.headlineLarge?.copyWith(
              // color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            stat['label']!,
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildValuesSection() {
    final values = [
      {
        'icon': Icons.check_circle_outline,
        'title': 'Premium Quality',
        'description':
            'Every pair of shoes is crafted with meticulous attention to detail, using the finest materials and expert craftsmanship.',
      },
      // Add other values here
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        children: [
          Text(
            'Our Values',
            style: Get.textTheme.headlineMedium?.copyWith(
              // color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: values.map((value) => _buildValueCard(value)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildValueCard(Map<String, dynamic> value) {
    return Container(
      width: Get.width > 600 ? 280 : Get.width - 48,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              value['icon'],
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            value['title'],
            style: Get.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value['description'],
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildCTASection() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/about/cta-bg.jpg',
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
          opacity: const AlwaysStoppedAnimation(0.2),
        ),
        Container(
          height: 400,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Join Our Journey',
                    style: Get.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Experience the perfect blend of tradition and innovation with AhziyaH shoes. Your comfort journey begins here.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.find<LayoutController>().handleIndexChanged(2);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Explore Our Collection'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
