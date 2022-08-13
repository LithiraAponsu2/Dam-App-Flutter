import 'package:dam_app/widgets/gate_pos.dart';
import 'package:dam_app/widgets/gate_pos_anim.dart';
import 'package:dam_app/widgets/spillway_data.dart';
import 'package:dam_app/widgets/stoplog.dart';
import 'package:flutter/material.dart';
import 'package:dam_app/models/data_list.dart';

import '../constants.dart';

class DamDataScreen extends StatefulWidget {
  DamDataScreen({Key? key}) : super(key: key);

  @override
  State<DamDataScreen> createState() => _DamDataScreenState();
}

class _DamDataScreenState extends State<DamDataScreen> {
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      // controller: controller,
      child: Column(
        children: [
          const Divider(
            color: Color(0xffFDC65B),
            indent: 20,
            endIndent: 20,
            thickness: 0.6,
          ),

          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: const Text(
                  "Gate Position",
                  style: TextStyle(
                    color: Color(0xffFDC65B),
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: deviceWidth! / 4,
                    width: deviceWidth! / 4,
                    child: GateAnimation(
                      progress: (data[11] / 15) * 100,
                    ),
                  ),
                  SizedBox(
                    height: deviceWidth! / 4,
                    width: deviceWidth! / 4,
                    child: GateAnimation(
                      progress: (data[12] / 15) * 100,
                    ),
                  ),
                  SizedBox(
                    height: deviceWidth! / 4,
                    width: deviceWidth! / 4,
                    child: GateAnimation(
                      progress: (data[13] / 15) * 100,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GatePosition(value: data[11]),
              GatePosition(value: data[12]),
              GatePosition(value: data[13]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              StopLog(),
              StopLog(),
              StopLog(),
            ],
          ),
          const Divider(
            color: Color(0xffFDC65B),
            indent: 20,
            endIndent: 20,
            thickness: 0.6,
          ),
          // 3rd row for the animation of gates
          Container(
            padding: const EdgeInsets.all(5),
            child: const Text(
              "Reservoir Data",
              style: TextStyle(
                color: Color(0xffFDC65B),
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SpillwayData(
                  value: data[0],
                  dataTitle: "Reservoir Elevation",
                  unit: 'm MSL',
                ),
                SpillwayData(
                  value: data[1],
                  dataTitle: "Stored Volume",
                  unit: 'MCM',
                ),
                const SpillwayData(
                  value: 0.00,
                  dataTitle: "Time to Fil",
                  unit: 'min',
                ),
                SpillwayData(
                  value: 703 - data[0],
                  dataTitle: "Height to Fill",
                  unit: 'm',
                ),
                SpillwayData(
                  value: 170.898 - data[1],
                  dataTitle: "Buffer volume",
                  unit: 'MCM',
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xffFDC65B),
            indent: 20,
            endIndent: 20,
            thickness: 0.6,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: const Text(
              "Power Data",
              style: TextStyle(
                color: Color(0xffFDC65B),
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SpillwayData(
                  value: data[5],
                  dataTitle: "Power Discharge",
                  unit: 'MCM',
                ),
                SpillwayData(
                  value: data[6],
                  dataTitle: "Power Generation",
                  unit: 'GWh',
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xffFDC65B),
            indent: 20,
            endIndent: 20,
            thickness: 0.6,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: const Text(
              "Discharge Data",
              style: TextStyle(
                color: Color(0xffFDC65B),
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SpillwayData(
                  value: data[7],
                  dataTitle: "B.O. Release",
                  unit: 'MCM',
                ),
                SpillwayData(
                  value: data[8],
                  dataTitle: "Spill Discharge",
                  unit: 'MCM',
                ),
                SpillwayData(
                  value: data[9],
                  dataTitle: "Total discharge",
                  unit: 'MCM',
                ),
                SpillwayData(
                  value: data[10],
                  dataTitle: "Inflow",
                  unit: 'MCM',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
