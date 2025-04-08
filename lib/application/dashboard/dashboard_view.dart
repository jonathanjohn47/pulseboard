import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dashboard_controller.dart';

// Define a provider for the data using Riverpod's Provider
final temperatureDataProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return DashboardController().generateTemperatureData();
});

class DashboardView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(temperatureDataProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'Sensor Overview',
              style:
              Theme
                  .of(context)
                  .textTheme
                  .bodyMedium ??
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Interactive bubble chart
            Expanded(child: BubbleChart(data: data)),
            // Toggles for user interactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Size by:'),
                ToggleButtons(
                  children: [Text('Humidity'), Text('Pressure')],
                  isSelected: ref.watch(metricSelectionProvider),
                  onPressed: (int index) {
                    ref.read(metricSelectionProvider.notifier).toggle(index);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BubbleChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  BubbleChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.5,
        child: BubbleChartWidget(data: data),
      ),
    );
  }
}

// Assuming that BubbleChartWidget is intended to create a visualization
// and there isn't a recursive call
class BubbleChartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  BubbleChartWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    // Correct the erroneous instantiation
    return CustomPaint(
      painter: BubbleChartPainter(data: data),
      child: Container(),
    );
  }
}

// Mockup for a custom painter for BubbleChart
class BubbleChartPainter extends CustomPainter {
  final List<Map<String, dynamic>> data;

  BubbleChartPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    // Implement painting logic
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


// Provider to manage metric selection state
final metricSelectionProvider = StateNotifierProvider<
    MetricSelectionNotifier,
    List<bool>>((ref) {
  return MetricSelectionNotifier();
});

class MetricSelectionNotifier extends StateNotifier<List<bool>> {
  MetricSelectionNotifier() : super([true, false]); // Initial state

  void toggle(int index) {
    // Mutates state safely
    state = List.generate(state.length, (i) => i == index);
  }
}
