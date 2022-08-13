import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

import '../models/data_list.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd kk:mm').format(now);

Future sendEmail() async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(
      {
        'service_id': 'service_4bual6k',
        'template_id': 'template_mfscfmc',
        'user_id': 'Z5Th09Zcjl2tEQ4wO',
        'accessToken': 'ECbebTDFKYkIKgoKZEQyf',
        'template_params': {
          'subject_date_time': formattedDate,
          '0': 'Reservoir Elevation: ${data[0].toStringAsFixed(3)}',
          '1': 'Gross Storage: ${data[1].toStringAsFixed(3)}',
          '2': 'Percentage of Gross Storage: ${data[2].toStringAsFixed(3)}',
          '3': 'Active Storage: ${data[3].toStringAsFixed(3)}',
          '4': 'Percentage of Active Storage: ${data[4].toStringAsFixed(3)}',
          '5': 'Power Discharge: ${data[5].toStringAsFixed(3)}',
          '6': 'Power Generation: ${data[6].toStringAsFixed(3)}',
          '7': 'Bottom outlet Release: ${data[7].toStringAsFixed(3)}',
          '8': 'Spill Discharge: ${data[8].toStringAsFixed(3)}',
          '9': 'Total Discharge: ${data[9].toStringAsFixed(3)}',
          '10': 'Inflow: ${data[10].toStringAsFixed(3)}',
        },
      },
    ),
  );
  return response.statusCode;
}
