import 'dart:convert';

import 'package:udisks/udisks.dart';

void main() async {
  var client = UDisksClient();
  await client.connect();

  for (var drive in client.blockDevices) {
    double size;
    String units;
    if (drive.size > 1000000000) {
      size = drive.size / 1000000000;
      units = 'GB';
    } else if (drive.size > 1000000) {
      size = drive.size / 1000000;
      units = 'MB';
    } else if (drive.size > 1000) {
      size = drive.size / 1000;
      units = 'kB';
    } else {
      size = drive.size.toDouble();
      units = 'B';
    }
    print('${utf8.decode(drive.device)} ${size.toStringAsFixed(1)}$units');
  }

  await client.close();
}
