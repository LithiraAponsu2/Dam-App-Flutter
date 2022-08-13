import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rive/rive.dart';

class GateAnimation extends StatefulWidget {
  const GateAnimation({Key? key, required this.progress}) : super(key: key);

  final double progress;

  @override
  State<GateAnimation> createState() => _GateAnimationState();
}

class _GateAnimationState extends State<GateAnimation> {
  Artboard? _riveArtBoard;
  StateMachineController? _controller;
  SMIInput<double>? _progress;

  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/new_file.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, "State Machine 1");
        if (controller != null) {
          artboard.addController(controller);
          _progress = controller.findInput('Number 1');
          setState(() {
            _riveArtBoard = artboard;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _progress?.value = 100 - widget.progress.toDouble();
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 163, 134, 134),
        ),
      ),
      child: _riveArtBoard == null
          ? const SizedBox()
          : Rive(artboard: _riveArtBoard!),
    );
  }
}
