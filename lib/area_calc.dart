import 'package:flutter/material.dart';
import 'dart:math';

class AreaCalculator extends StatefulWidget {
  const AreaCalculator({super.key});

  @override
  State<AreaCalculator> createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  final rectWidthController = TextEditingController();
  final rectHeightController = TextEditingController();
  final circRadiusController = TextEditingController();
  final circDiameterController = TextEditingController();
  final triBaseController = TextEditingController();
  final triHeightController = TextEditingController();

  String rectResult = '';
  String circResult = '';
  String triResult = '';

  void calculateRectangle() {
    final width = double.tryParse(rectWidthController.text) ?? 0;
    final height = double.tryParse(rectHeightController.text) ?? 0;
    setState(() {
      rectResult = (width * height).toStringAsFixed(2);
    });
  }

  void calculateCircle() {
    final radiusText = circRadiusController.text;
    final diameterText = circDiameterController.text;
    double result;

    if (diameterText.isEmpty) {
      final radius = double.tryParse(radiusText) ?? 0;
      result = pi * pow(radius, 2);
    } else {
      final diameter = double.tryParse(diameterText) ?? 0;
      result = pi * pow(diameter / 2, 2);
    }

    setState(() {
      circResult = result.toStringAsFixed(2);
    });
  }

  void calculateTriangle() {
    final base = double.tryParse(triBaseController.text) ?? 0;
    final height = double.tryParse(triHeightController.text) ?? 0;
    setState(() {
      triResult = ((base * height) / 2).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Shape Area Calculator'),
        backgroundColor: const Color(0xFF003366),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  shapeImageBox("Rectangle", "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Rectangle_%28plain%29.svg/400px-Rectangle_%28plain%29.svg.png"),
                  shapeImageBox("Circle", "https://static.vecteezy.com/system/resources/previews/001/192/213/original/circle-png.png"),
                  shapeImageBox("Triangle", "https://cdn.glitch.global/80b4fe48-256c-4001-aa45-c4952fb78e7d/triangle-png-42412.png?v=1718739843122"),
                ],
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  inputCard("Rectangle", rectWidthController, rectHeightController, calculateRectangle),
                  inputCard("Circle", circRadiusController, circDiameterController, calculateCircle, isCircle: true),
                  inputCard("Triangle", triBaseController, triHeightController, calculateTriangle),
                ],
              ),
              const SizedBox(height: 30),
              answerRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget shapeImageBox(String label, String url) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade200,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
              ),
            ],
          ),
          child: Image.network(url),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget inputCard(String label, TextEditingController ctrl1, TextEditingController ctrl2, VoidCallback onPress, {bool isCircle = false}) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          inputField(isCircle ? "Enter radius" : "Enter value 1", ctrl1),
          if (isCircle)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text("OR", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          inputField(isCircle ? "Enter diameter" : "Enter value 2", ctrl2),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onPress,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF003366),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text("Calculate", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget inputField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget answerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        resultBox("Rectangle", rectResult, Colors.blue),
        resultBox("Circle", circResult, Colors.purple),
        resultBox("Triangle", triResult, Colors.green),
      ],
    );
  }

  Widget resultBox(String label, String value, Color color) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text("$label Area", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
