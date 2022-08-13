import 'package:dam_app/models/data_list.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd kk:mm').format(now);

String smsBody = '''Date and Time: ${formattedDate.toString()}
Reservoir Elevation: ${data[0].toStringAsFixed(3)}
Gross Storage: ${data[1].toStringAsFixed(3)}
Percentage of Gross Storage: ${data[2].toStringAsFixed(3)}
Active Storage: ${data[3].toStringAsFixed(3)}
Percentage of Active Storage: ${data[4].toStringAsFixed(3)}
Power Discharge: ${data[5].toStringAsFixed(3)}
Power Generation: ${data[6].toStringAsFixed(3)}
Bottom outlet Release: ${data[7].toStringAsFixed(3)}
Spill Discharge: ${data[8].toStringAsFixed(3)}
Total Discharge: ${data[9].toStringAsFixed(3)}
Inflow: ${data[10].toStringAsFixed(3)}''';

void sendSMS() {
  launchUrlString('sms:{your_default_phone_number}?body=$smsBody');
}
