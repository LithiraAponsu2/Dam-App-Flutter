import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem(
      {Key? key, required this.id, required this.title, required this.value})
      : super(key: key);

  final String id;
  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: const Color(0xff32373B),
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xff32373B),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xffE7EEFB),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Color(0xffFDC65B),
                    thickness: 0.6,
                  ),
                  Text(
                    value.toString(),
                    style: const TextStyle(
                      color: Color(0xffE7EEFB),
                      fontSize: 20,
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
}
