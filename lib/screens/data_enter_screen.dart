import 'package:dam_app/constants.dart';
import 'package:dam_app/models/data_list.dart';
import 'package:dam_app/widgets/data_enter_item.dart';
import 'package:dam_app/widgets/send_mail.dart';
import 'package:dam_app/widgets/send_sms.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DataEnterScreen extends StatefulWidget {
  const DataEnterScreen({Key? key}) : super(key: key);

  @override
  State<DataEnterScreen> createState() => _DataEnterScreenState();
}

class _DataEnterScreenState extends State<DataEnterScreen> {
  TextEditingController _value = TextEditingController();
  double? value;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: deviceHeight! * 0.70,
            child: GridView(
              padding: const EdgeInsets.all(25),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2.5 / 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 50,
              ),
              children: const [
                DataEnterItem(
                  id: 1,
                  title: "Reservoir Elevation",
                ),
                DataEnterItem(
                  id: 2,
                  title: "Gross storage",
                ),
                // DataEnterItem(
                //   id: 3,
                //   title: "Percentage of gross storage",
                // ),
                DataEnterItem(
                  id: 4,
                  title: "Active storage",
                ),
                // DataEnterItem(
                //   id: 5,
                //   title: "Percentage of active storage",
                // ),
                DataEnterItem(
                  id: 6,
                  title: "Power discharge",
                ),
                DataEnterItem(
                  id: 7,
                  title: "Power generation",
                ),
                DataEnterItem(
                  id: 8,
                  title: "Bottom outlet release",
                ),
                DataEnterItem(
                  id: 9,
                  title: "Spill discharge",
                ),
                // DataEnterItem(
                //   id: 10,
                //   title: "Total discharge",
                // ),
                DataEnterItem(
                  id: 11,
                  title: "Inflow",
                ),
                DataEnterItem(
                  id: 12,
                  title: "1st Gate position",
                ),
                DataEnterItem(
                  id: 13,
                  title: "2nd Gate position",
                ),
                DataEnterItem(
                  id: 14,
                  title: "3rd Gate position",
                ),
              ],
            ),
          ),
          SizedBox(
            height: deviceHeight! * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: const Color(0xffE7EEFB),
                    side: const BorderSide(
                      color: Color(0xffE7EEFB),
                    ),
                  ),
                  onPressed: () {
                    sendSMS();
                  },
                  child: const Text("Send SMS"),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: const Color(0xffE7EEFB),
                    side: const BorderSide(
                      color: Color(0xffE7EEFB),
                    ),
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('dam_data/KgOtgYCJ9Ckz9m3Qxezq/lists')
                        .add(
                      {
                        "saved_list": data,
                        "time_stamp": FieldValue.serverTimestamp(),
                      },
                    );
                  },
                  child: const Text("Save"),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: const Color(0xffE7EEFB),
                    side: const BorderSide(
                      color: Color(0xffE7EEFB),
                    ),
                  ),
                  onPressed: () {
                    sendEmail();
                  },
                  child: const Text("Send Email"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
