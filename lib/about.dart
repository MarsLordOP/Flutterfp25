import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'About Qualifi',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.redAccent,
                    Colors.redAccent.withOpacity(0.8),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.school,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome to Qualifi',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Making college search simpler, smarter, and more accessible for high school students.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            
            // Main Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Mission Section
                  _buildContentCard(
                    icon: Icons.tablet_outlined,
                    title: 'Our Mission',
                    content: 'Qualifi strives to educate high schoolers about college and aid Juniors and Seniors in their important decision to pursue higher education. With college attendance rates declining across the country, our goal is to make the search process simpler, smarter, and more accessible.',
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Founder Section
                  _buildContentCard(
                    icon: Icons.person_outline,
                    title: 'Meet the Founder',
                    content: 'My name is Marcellus Forte. Im a 14-year-old student at Saint Joseph Notre Dame High School in Alameda, California. Im passionate about sports — I play basketball and swim competitively — and Im deeply interested in technology and entrepreneurship.',
                  ),
                  
                  const SizedBox(height: 16),
                  
                  _buildContentCard(
                    icon: Icons.groups_outlined,
                    title: 'The Journey',
                    content: 'Im a proud participant in the Hidden Genius Project, a program that empowers young Black males through mentorship and intensive tech training. This journey inspired me to build something that could help other students navigate one of the biggest decisions of their lives — choosing a college.',
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Inspiration Section
                  _buildContentCard(
                    icon: Icons.lightbulb_outline,
                    title: 'The Inspiration Behind Qualifi',
                    content: 'The idea for Qualifi came from a middle school trip to Washington, D.C. where I had the chance to visit several college campuses. That experience opened my eyes to how overwhelming — and exciting — the college search can be. I created Qualifi to make it easier for students to explore, evaluate, and discover colleges that truly fit them.',
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Call to Action
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.redAccent.withOpacity(0.1),
                          Colors.redAccent.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.redAccent.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.rocket_launch,
                          size: 40,
                          color: Colors.redAccent,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Ready to start your college journey?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Let Qualifi guide you to your perfect match',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Colors.redAccent,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}