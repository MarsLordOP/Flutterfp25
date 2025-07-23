import 'package:flutter/material.dart';

class PricingPage extends StatefulWidget {
  final bool openedFromSearch;
  final void Function(int plan)? onPlanPurchased;

  const PricingPage({
    super.key,
    required this.openedFromSearch,
    this.onPlanPurchased,
  });

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  int userPaidPlan = 0;

  void _handleBuy(String planTitle) {
    int plan = (planTitle == 'Permanent') ? 2 : 1;

    setState(() {
      userPaidPlan = plan;
    });

    widget.onPlanPurchased?.call(plan);

    if (widget.openedFromSearch) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.openedFromSearch && userPaidPlan == 2) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Access Granted'),
          centerTitle: true,
          backgroundColor: Colors.green.shade600,
          foregroundColor: Colors.white,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.green.shade50, Colors.white],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 80,
                    color: Colors.green.shade600,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'You have purchased the Permanent Plan. Thank you!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Continue to Search',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    final plans = [
      {
        'title': '1 Time Use',
        'price': '\$4.99',
        'features': [
          'One time use',
          'Limited colleges',
          'No ads',
        ],
        'color': Colors.blue.shade600,
        'gradient': [Colors.blue.shade400, Colors.blue.shade600],
      },
      {
        'title': 'Permanent',
        'price': '\$14.99',
        'features': [
          'Unlimited searches',
          'All colleges',
          'Clickable links',
          'No ads',
        ],
        'color': Colors.deepPurple.shade600,
        'gradient': [Colors.deepPurple.shade400, Colors.deepPurple.shade600],
        'popular': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Plan'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade600,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple.shade50, Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Choose the plan that fits your needs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Unlock powerful college search features',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ...plans.map((plan) {
                    final title = plan['title'] as String;
                    final purchased = (userPaidPlan == 2) || (userPaidPlan == 1 && title == '1 Time Use');
                    final isPopular = plan['popular'] as bool? ?? false;

                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: (plan['color'] as Color).withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Card(
                            margin: EdgeInsets.zero,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: isPopular 
                                  ? (plan['color'] as Color) 
                                  : Colors.grey.shade200,
                                width: isPopular ? 2 : 1,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white,
                                    (plan['color'] as Color).withOpacity(0.05),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          title,
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: plan['color'] as Color,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      plan['price'] as String,
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w900,
                                        color: plan['color'] as Color,
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    ...List<Widget>.from((plan['features'] as List).map((f) => Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 6),
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                  color: (plan['color'] as Color).withOpacity(0.1),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.check,
                                                  color: plan['color'] as Color,
                                                  size: 18,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: Text(
                                                  f,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))),
                                    const SizedBox(height: 28),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: purchased
                                          ? null
                                          : LinearGradient(
                                              colors: plan['gradient'] as List<Color>,
                                            ),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: purchased ? null : () => _handleBuy(title),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: purchased 
                                            ? Colors.grey.shade400 
                                            : Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          minimumSize: const Size(double.infinity, 52),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Text(
                                          purchased ? 'Purchased' : 'Buy Now',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: purchased ? Colors.white : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (isPopular)
                          Positioned(
                            top: 0,
                            right: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade500,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'MOST POPULAR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}