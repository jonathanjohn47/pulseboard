import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulseboard/models/dashboard_data.dart';
import 'package:pulseboard/models/sensor_data.dart';
import 'package:pulseboard/providers/dashboard_provider.dart';

void main() {
  group('Dashboard Provider Unit Tests', () {
    final dashboardDataSample = DashboardData(sensorReadings: [
      const SensorData(sensorId: 'sensor_001', temperature: 23.5, humidity: 45.0, pressure: 1013.25, status: 'mild', time: '08:00'),
      const SensorData(sensorId: 'sensor_002', temperature: 25.1, humidity: 5.2, pressure: 1012.80, status: 'warm', time: '08:15'),
      const SensorData(sensorId: 'sensor_003', temperature: 22.8, humidity: 4.5, pressure: 1014.00, status: 'mild', time: '08:30'),
      const SensorData(sensorId: 'sensor_004', temperature: 27.0, humidity: 55.0, pressure: 1011.75, status: 'hot', time: '08:45'),
      const SensorData(sensorId: 'sensor_005', temperature: 21.9, humidity: 22.3, pressure: 1013.50, status: 'cool', time: '09:00'),
    ]);

    test('getMinimumTemperatureProvider returns the correct minimum temperature', () {
      final container = ProviderContainer(overrides: [
        getDashboardDataProvider.overrideWithValue(dashboardDataSample),
      ]);
      final minimumTemperature = container.read(getMinimumTemperatureProvider);
      expect(minimumTemperature, 21.9);
      container.dispose();
    });

    test('getMaximumHumidityProvider returns the correct maximum humidity', () {
      final container = ProviderContainer(overrides: [
        getDashboardDataProvider.overrideWithValue(dashboardDataSample),
      ]);
      final maximumHumidity = container.read(getMaximumHumidityProvider);
      expect(maximumHumidity, 55.0);
      container.dispose();
    });
  });
}