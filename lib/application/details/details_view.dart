import 'package:flutter/material.dart';
import 'details_controller.dart';

class DetailsView extends StatelessWidget {
  final DetailsController _controller = DetailsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
        child: Text('Details Content Here'), // Placeholder for actual details content
      ),
    );
  }
}