import 'package:flutter/material.dart';

class StopLog extends StatefulWidget {
  const StopLog({Key? key}) : super(key: key);

  @override
  State<StopLog> createState() => _StopLogState();
}

class _StopLogState extends State<StopLog> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(
          () {
            isPressed = !isPressed;
          },
        );
      },
      style: ElevatedButton.styleFrom(
        primary: isPressed
            ? const Color(0xffFD605A)
            : const Color(
                0xffFDC65B,
              ),
      ),
      child: const Text(
        'Stoplog',
        style: TextStyle(
          color: Color(0xff22272B),
        ),
      ),
    );
  }
}
