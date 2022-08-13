import 'package:flutter/material.dart';

class SpillwayData extends StatelessWidget {
  const SpillwayData({
    Key? key,
    required this.value,
    required this.dataTitle,
    required this.unit,
  }) : super(key: key);

  final String dataTitle;
  final double value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Material(
        color: const Color(0xff32373B),
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xff32373B),
            border: Border.all(
              color: const Color(0xff32373B),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      dataTitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xffE7EEFB),
                      ),
                    ),
                    const Divider(),
                    Text(
                      '${value.toStringAsFixed(2)} $unit',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xffE7EEFB),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
