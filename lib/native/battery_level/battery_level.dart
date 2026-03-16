import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  BatteryPageState createState() => BatteryPageState();
}

class BatteryPageState extends State<BatteryPage> {

  final platform=MethodChannel("Battery");

  String batteryLevel="Unknown";

  Future<void> getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod("getBatteryLevel");

      setState(() {
        batteryLevel = "Battery Level $result%";
      });

    } catch (e) {
      print(e.toString());
      setState(() {
        batteryLevel = "Failed to get battery level:";
      });

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(batteryLevel),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed:getBatteryLevel,
              child: Text("Get Battery Level"),
            ),
          ],
        ),
      ),
    );
  }
}