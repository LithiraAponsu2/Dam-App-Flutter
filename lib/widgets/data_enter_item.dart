import 'package:dam_app/models/data_list.dart';
import 'package:flutter/material.dart';

class DataEnterItem extends StatefulWidget {
  const DataEnterItem({
    Key? key,
    this.title,
    this.id,
  }) : super(key: key);

  final int? id;
  final String? title;

  @override
  State<DataEnterItem> createState() => _DataEnterItemState();
}

class _DataEnterItemState extends State<DataEnterItem> {
  TextEditingController _value = TextEditingController();
  double? value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openDialog();
      },
      child: Material(
        color: const Color(0xff32373B),
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color(0xff32373B),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  widget.title!,
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
                '${data[widget.id! - 1]} ${unit[widget.id! - 1]}',
                style: const TextStyle(
                  color: Color(0xffE7EEFB),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future openDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        backgroundColor: const Color(0xff32373B),
        title: Text(
          widget.title!,
          style: const TextStyle(
            color: Color(0xffFDC65B),
          ),
        ),
        content: TextField(
          keyboardType: TextInputType.number,
          style: const TextStyle(
            color: Color(0xffE7EEFB),
          ),
          controller: _value,
          decoration: const InputDecoration(
            hintText: "Enter value here...",
            hintStyle: TextStyle(
              color: Color.fromARGB(200, 154, 176, 216),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                value = double.parse(_value.text);
              });
              data[widget.id! - 1] = value!;
              data[2] = (data[1] / 170.898) * 100;
              data[4] = (data[3] / 170.898) * 100;
              data[9] = data[5] + data[7] + data[8];
              Navigator.of(context).pop();
            },
            child: const Text(
              "Submit",
              style: TextStyle(
                color: Color(0xffFD605A),
              ),
            ),
          )
        ],
      ),
    );
  }
}
