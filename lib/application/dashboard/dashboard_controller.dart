// Import the necessary packages first
import 'dart:math';

class DashboardController {
  // Method to generate random data for temperature
  List<Map<String, dynamic>> generateTemperatureData() {
    Random random = Random();
    List<Map<String, dynamic>> data = [];
    for (var i = 0; i < 10; i++) {
      data.add({
        'time': '08:0$i',
        'temperature': random.nextInt(100), // Random temperature
        'humidity': random.nextInt(100), // Random humidity
        'pressure': 900 + random.nextInt(200), // Random pressure within the range
        'status': random.nextDouble(), // Random status for anomaly
      });
    }
    return data;
  }
  List<Map<String, dynamic>> sensorData = [
    {'temperature': 25, 'time': 10, 'humidity': 60, 'status': 0.1},
    {'temperature': 28, 'time': 20, 'humidity': 55, 'status': 0.2},
    {'temperature': 27, 'time': 30, 'humidity': 70, 'status': 0.4},
    // Add more data as required
  ];
  // Method to simulate anomalies in the data
  List<Map<String, dynamic>> simulateAnomalies() {
    return generateTemperatureData().map((dataPoint) {
      double anomaly = dataPoint['status'];
      String anomalyColor;
      if (anomaly == -1 || anomaly == null) {
        anomalyColor = 'Gray';
      } else if (anomaly >= 0.51) {
        anomalyColor = 'Red';
      } else if (anomaly > 0.0) {
        anomalyColor = 'Yellow';
      } else {
        anomalyColor = 'Green';
      }
      return {
        ...dataPoint,
        'anomalyColor': anomalyColor,
      };
    }).toList();
  }

  // Method to get mock data arranged by location for the dashboard
  Map<String, List<Map<String, dynamic>>> getDataGroupedByLocation() {
    List<Map<String, dynamic>> data = generateTemperatureData();
    return {
      "Line A": data.take(5).toList(),
      "Line B": data.skip(5).take(5).toList(),
    };
  }
}