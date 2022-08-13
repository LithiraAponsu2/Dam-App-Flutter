import 'package:flutter/material.dart';

class GatePosition extends StatelessWidget {
  const GatePosition({Key? key, required this.value}) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Column(
            children: [
              const Text(
                "Gate position",
                style: TextStyle(
                  color: Color(0xffE7EEFB),
                ),
              ),
              Text(
                "${value.toStringAsFixed(1)} m",
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xffE7EEFB),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
