import 'package:flutter/material.dart';
import 'college_search_form.dart';
import 'login.dart';
import 'signup.dart';
import 'pricing.dart';
import 'contact_me.dart';
import 'features.dart';
import 'about.dart';

class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int userPaidPlan = 0;
  late AnimationController _pulseController;
  late AnimationController _glowController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _glowController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    
    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    
    _glowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  void _updatePaymentStatus(int plan) {
    setState(() {
      userPaidPlan = plan;
    });
  }

  Future<void> _handleSearchPressed() async {
    if (userPaidPlan == 2) {
      _goToCollegeSearch();
    } else {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PricingPage(
            openedFromSearch: true,
            onPlanPurchased: _updatePaymentStatus,
          ),
        ),
      );

      if (result == true) {
        _goToCollegeSearch();
      }
    }
  }

  void _goToCollegeSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CollegeSearchForm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F0F23)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Colors.cyanAccent, Colors.blueAccent],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.cyanAccent,
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(Icons.school, size: 28, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const FuturisticNavLink(text: 'Home', selected: true),
                    FuturisticNavLink(
                      text: 'Features',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FeaturesPage(userName: widget.userName),
                          ),
                        );
                      },
                    ),
                    FuturisticNavLink(
                      text: 'Pricing',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PricingPage(
                              openedFromSearch: false,
                              onPlanPurchased: _updatePaymentStatus,
                            ),
                          ),
                        );
                      },
                    ),
                    FuturisticNavLink(
                      text: 'Contact',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ContactPage(),
                          ),
                        );
                      },
                    ),
                    FuturisticNavLink(
                      text: 'About',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.cyanAccent, width: 1),
                gradient: const LinearGradient(
                  colors: [Colors.transparent, Color(0xFF1A1A2E)],
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.cyanAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: const Text('Login', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  colors: [Colors.cyanAccent, Colors.blueAccent],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.cyanAccent,
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: const Color(0xFF0A0A0F),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: const Text('Sign-up', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.5,
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F0F23),
              Color(0xFF0A0A0F),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _glowAnimation,
                  builder: (context, child) {
                    return Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: Colors.cyanAccent.withOpacity(0.3 + _glowAnimation.value * 0.4),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyanAccent.withOpacity(0.2 + _glowAnimation.value * 0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [Colors.cyanAccent, Colors.blueAccent, Colors.purpleAccent],
                            ).createShader(bounds),
                            child: Text(
                              'Welcome, ${widget.userName}!',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 32,
                                    letterSpacing: 1.2,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF0F0F23).withOpacity(0.7),
                              border: Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
                            ),
                            child: const Text(
                              'Qualifi helps students find the college of their choice. It includes a college search feature. Learn more in the about page above.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                                height: 1.5,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 48),
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _pulseAnimation.value,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Colors.blueAccent, Colors.purpleAccent],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.blueAccent,
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ElevatedButton.icon(
                          onPressed: _handleSearchPressed,
                          icon: const Icon(Icons.search, size: 24),
                          label: const Text('Search', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FuturisticNavLink extends StatefulWidget {
  final String text;
  final bool selected;
  final VoidCallback? onTap;

  const FuturisticNavLink({
    super.key,
    required this.text,
    this.selected = false,
    this.onTap,
  });

  @override
  State<FuturisticNavLink> createState() => _FuturisticNavLinkState();
}

class _FuturisticNavLinkState extends State<FuturisticNavLink> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: widget.selected || _isHovering
                  ? const LinearGradient(
                      colors: [Colors.cyanAccent, Colors.blueAccent],
                    )
                  : null,
              border: Border.all(
                color: widget.selected
                    ? Colors.transparent
                    : (_isHovering ? Colors.cyanAccent : Colors.transparent),
                width: 1,
              ),
              boxShadow: widget.selected || _isHovering
                  ? [
                      const BoxShadow(
                        color: Colors.cyanAccent,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.selected
                    ? const Color(0xFF0A0A0F)
                    : (_isHovering ? Colors.cyanAccent : Colors.white70),
                fontWeight: widget.selected ? FontWeight.bold : FontWeight.w600,
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}