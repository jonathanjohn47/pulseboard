import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/dashboard_provider.dart';

@RoutePage()
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final getDashboardDataFromProvider = ref.watch(getDashboardDataProvider);
    final isTemperature = ref.watch(isTemperatureProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Settings"), automaticallyImplyLeading: false),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:
                  () => ref.read(isTemperatureProvider.notifier).state = true,
              child: Text(
                "Temperature",
                style: TextStyle(
                  color: isTemperature ? Colors.white : Colors.blue,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  side: BorderSide(
                    color: Colors.grey,
                  ), // Optional: Add a border
                ),
                backgroundColor: isTemperature ? Colors.blue : null,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(isTemperatureProvider.notifier).state = false;
              },
              child: Text(
                "Humidity",
                style: TextStyle(
                  color: isTemperature ? Colors.blue : Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  side: BorderSide(
                    color: Colors.grey,
                  ), // Optional: Add a border
                ),
                backgroundColor: !isTemperature ? Colors.blue : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
