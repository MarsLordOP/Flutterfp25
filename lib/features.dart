import 'package:flutter/material.dart';
import 'home.dart';

class FeaturesPage extends StatefulWidget {
  final String userName;

  const FeaturesPage({super.key, required this.userName});

  @override
  State<FeaturesPage> createState() => _FeaturesPageState();
}

class _FeaturesPageState extends State<FeaturesPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late List<AnimationController> _itemAnimationControllers;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _itemAnimationControllers = List.generate(
      5, // Number of features
      (index) => AnimationController(
        duration: Duration(milliseconds: 300 + (index * 100)),
        vsync: this,
      ),
    );
    
    _startAnimations();
  }

  void _startAnimations() async {
    _animationController.forward();
    for (int i = 0; i < _itemAnimationControllers.length; i++) {
      await Future.delayed(Duration(milliseconds: i * 100));
      if (mounted) {
        _itemAnimationControllers[i].forward();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    for (var controller in _itemAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1E88E5);
    const Color _ = Color(0xFFFFEB3B);
    const Color accentColor = Color(0xFF4CAF50);
    const Color backgroundColor = Color(0xFFF8FAFC);

    final List<Map<String, dynamic>> features = [
      {
        'title': 'Search Colleges',
        'icon': Icons.search_rounded,
        'description': 'Explore universities across the U.S. with advanced filters like GPA, tuition, location, and more.',
        'color': primaryColor,
        'gradient': const LinearGradient(
          colors: [Color(0xFF1E88E5), Color(0xFF42A5F5)],
        ),
      },
      {
        'title': 'GPA Predictor',
        'icon': Icons.school_rounded,
        'description': 'AI-powered predictions based on your academic history, course difficulty, and performance trends.',
        'color': accentColor,
        'gradient': const LinearGradient(
          colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
        ),
      },
      {
        'title': 'College Insights',
        'icon': Icons.analytics_rounded,
        'description': 'Comprehensive profiles with tuition, acceptance rates, student life, and career outcomes.',
        'color': const Color(0xFFFF7043),
        'gradient': const LinearGradient(
          colors: [Color(0xFFFF7043), Color(0xFFFF8A65)],
        ),
      },
      {
        'title': '24/7 Support',
        'icon': Icons.support_agent_rounded,
        'description': 'Get instant help from our expert team through chat, email, or video consultations.',
        'color': const Color(0xFF9C27B0),
        'gradient': const LinearGradient(
          colors: [Color(0xFF9C27B0), Color(0xFFBA68C8)],
        ),
      },
      {
        'title': 'Smart Recommendations',
        'icon': Icons.psychology_rounded,
        'description': 'Personalized college suggestions using machine learning and your unique profile.',
        'color': const Color(0xFFFF6B35),
        'gradient': const LinearGradient(
          colors: [Color(0xFFFF6B35), Color(0xFFFFAB40)],
        ),
      },
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: FadeTransition(
                opacity: _animationController,
                child: const Text(
                  'App Features',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1E88E5),
                      Color(0xFF1565C0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.3),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.easeOutQuart,
                )),
                child: FadeTransition(
                  opacity: _animationController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello ${widget.userName}! 👋',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A202C),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Discover all the powerful tools at your fingertips',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final feature = features[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.5),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: _itemAnimationControllers[index],
                      curve: Curves.easeOutCubic,
                    )),
                    child: FadeTransition(
                      opacity: _itemAnimationControllers[index],
                      child: _FeatureCard(
                        feature: feature,
                        index: index,
                      ),
                    ),
                  ),
                );
              },
              childCount: features.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.3),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.easeOutQuart,
                )),
                child: FadeTransition(
                  opacity: _animationController,
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
                      ),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.home_rounded, size: 20),
                      label: const Text(
                        'Back to Home',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => HomePage(userName: widget.userName),
                            transitionDuration: const Duration(milliseconds: 400),
                            transitionsBuilder: (_, animation, __, child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(-1, 0),
                                  end: Offset.zero,
                                ).animate(CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOutCubic,
                                )),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final Map<String, dynamic> feature;
  final int index;

  const _FeatureCard({
    required this.feature,
    required this.index,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _hoverController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _hoverController.reverse();
      },
      child: AnimatedBuilder(
        animation: _hoverController,
        builder: (context, child) {
          return Transform.scale(
            scale: 1.0 + (_hoverController.value * 0.02),
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: widget.feature['color'].withOpacity(
                      0.1 + (_hoverController.value * 0.1)
                    ),
                    blurRadius: 15 + (_hoverController.value * 10),
                    offset: Offset(0, 5 + (_hoverController.value * 5)),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  // Add feature-specific navigation here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Opening ${widget.feature['title']}...'),
                      backgroundColor: widget.feature['color'],
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Hero(
                        tag: 'feature_${widget.index}',
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: widget.feature['gradient'],
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: widget.feature['color'].withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            widget.feature['icon'],
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.feature['title'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1A202C),
                                    ),
                                  ),
                                ),
                                AnimatedRotation(
                                  turns: _isHovered ? 0.25 : 0,
                                  duration: const Duration(milliseconds: 200),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: widget.feature['color'],
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.feature['description'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF64748B),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}