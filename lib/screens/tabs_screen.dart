import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dam_app/screens/data_enter_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dam_app/models/data_list.dart';
import '../screens/dam_data_screen.dart';
import '../screens/weather_data_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': WeatherDataScreen(),
      'title': 'Weather Data',
    },
    {
      'page': DamDataScreen(),
      'title': 'Dam Data',
    },
    {
      'page': DataEnterScreen(),
      'title': 'Enter Data',
    },
  ];

  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final screens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff22272B),
      appBar: AppBar(
        backgroundColor: const Color(0xff22272B),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('dam_data/KgOtgYCJ9Ckz9m3Qxezq/lists')
                  .orderBy(
                    'time_stamp',
                    descending: true,
                  )
                  .snapshots()
                  .listen(
                (event) {
                  data = List.from(event.docs[0]['saved_list']);
                },
              );
            },
            icon: const Icon(
              Icons.replay,
            ),
          )
        ],
        title: Center(
          child: Text(
            '${_pages[_selectedPageIndex]['title']}',
            style: const TextStyle(
              color: Color(0xffFDC65B),
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(
            color: Color(0xffE7EEFB),
          ),
        ),
        child: CurvedNavigationBar(
          index: 1,
          onTap: _selectPage,
          color: const Color(0xff373C40),
          items: const [
            Icon(Icons.cloud_queue),
            Icon(Icons.water_sharp),
            Icon(Icons.edit_note),
          ],
          height: 60,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
