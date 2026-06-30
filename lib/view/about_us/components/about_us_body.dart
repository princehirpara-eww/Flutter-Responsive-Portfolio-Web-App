import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/intro_body.dart'; // We can reuse OutlinedHoverButton or make one
import 'package:flutter_portfolio/view%20model/controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final isMobile = Responsive.isLargeMobile(context) || Responsive.isMobile(context);
    final double topSpacing = size.height * 0.14;

    if (isMobile) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: topSpacing),
            _buildHeader(context),
            const SizedBox(height: 16),
            _buildDescription(),
            const SizedBox(height: 32),
            _buildStatsBanner(isMobile: true),
            const SizedBox(height: 40),
            _buildApproachSection(context, isMobile: true),
            const SizedBox(height: 40),
          ],
        ),
      );
    }

    // Desktop/Tablet Split Row Layout
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Column: Texts, Stats, Approach
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            controller: aboutScrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: topSpacing * 0.8),
                _buildHeader(context),
                const SizedBox(height: 16),
                _buildDescription(),
                const SizedBox(height: 28),
                _buildStatsBanner(isMobile: false),
                const SizedBox(height: 36),
                _buildApproachSection(context, isMobile: false),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        const SizedBox(width: 48),
        // Right Column: Interactive Tech Stack / Profile Dashboard
        Expanded(
          flex: 3,
          child: Center(
            child: _buildRightVisualDashboard(size.width * 0.28 > 320 ? 320 : size.width * 0.28),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABOUT ME',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
                fontFamily: 'Poppins',
              ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: 3,
          color: AppColors.white,
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return const Text(
      'Passionate Mobile Application Developer with 4.5+ years of experience in Android and Flutter development. '
      'Skilled in building scalable, high-performance mobile applications using Kotlin, Java, Flutter, and Dart. '
      'Experienced in developing customer, driver, and vendor applications across ride-hailing, logistics, healthcare, marketplace, and container rental domains. '
      'Strong expertise in MVVM architecture, REST API integration, Google Maps API, payment gateways, and real-time sockets.',
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white70,
        fontSize: 15,
        height: 1.6,
      ),
    );
  }

  Widget _buildStatsBanner({required bool isMobile}) {
    final stats = [
      {'val': '4.5+', 'lbl': 'Years Experience'},
      {'val': '15+', 'lbl': 'Projects Done'},
      {'val': '10+', 'lbl': 'Happy Clients'},
    ];

    if (isMobile) {
      return Column(
        children: stats.map((s) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.04),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: Row(
            children: [
              Text(
                s['val']!,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                s['lbl']!,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ],
          ),
        )).toList(),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: stats.map((s) => Expanded(
        child: Container(
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.04),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s['val']!,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                s['lbl']!,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      )).toList(),
    );
  }

  Widget _buildApproachSection(BuildContext context, {required bool isMobile}) {
    final approaches = [
      {
        'title': 'Understand Goals',
        'desc': 'Deep dive into client business goals and user needs before writing any code.',
        'icon': Icons.lightbulb_outline_rounded
      },
      {
        'title': 'Clean UI/UX',
        'desc': 'Designing intuitive, minimalist, and responsive interfaces that delight users.',
        'icon': Icons.palette_outlined
      },
      {
        'title': 'Optimal Performance',
        'desc': 'Writing clean, scalable Dart/Kotlin code adhering strictly to best architectural patterns.',
        'icon': Icons.speed_rounded
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Approach',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        if (isMobile)
          Column(
            children: approaches.map((a) => _ApproachCard(
              title: a['title'] as String,
              desc: a['desc'] as String,
              icon: a['icon'] as IconData,
            )).toList(),
          )
        else
          Row(
            children: approaches.map((a) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _ApproachCard(
                  title: a['title'] as String,
                  desc: a['desc'] as String,
                  icon: a['icon'] as IconData,
                ),
              ),
            )).toList(),
          ),
      ],
    );
  }

  Widget _buildRightVisualDashboard(double dimension) {
    return Container(
      width: dimension,
      height: dimension * 1.1,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.1),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Primary Focus',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          _buildSpecialtyRow('Flutter Development', 0.95, AppColors.flutterBlue),
          _buildSpecialtyRow('Android SDK / Kotlin', 0.90, AppColors.androidGreen),
          _buildSpecialtyRow('MVVM / Clean Architecture', 0.85, Colors.orange),
          _buildSpecialtyRow('API & Sockets', 0.90, Colors.purpleAccent),
          const Spacer(),
          Center(
            child: Text(
              'Code quality is not an act, it is a habit.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialtyRow(String label, double percentage, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
              Text(
                '${(percentage * 100).toInt()}%',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.white10,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }
}

class _ApproachCard extends StatefulWidget {
  final String title;
  final String desc;
  final IconData icon;

  const _ApproachCard({
    required this.title,
    required this.desc,
    required this.icon,
  });

  @override
  State<_ApproachCard> createState() => _ApproachCardState();
}

class _ApproachCardState extends State<_ApproachCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white.withOpacity(0.09) : Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered ? Colors.white.withOpacity(0.20) : Colors.white.withOpacity(0.08),
            width: 1.2,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.12),
                blurRadius: 15,
                spreadRadius: 1,
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              color: Colors.white,
              size: 28,
            ),
            const SizedBox(height: 14),
            Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.desc,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                height: 1.5,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
