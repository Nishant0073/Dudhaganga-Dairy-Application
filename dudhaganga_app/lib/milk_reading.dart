import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MilkReading extends StatelessWidget {
  final int index;
  MilkReading(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("milk_reading_add_reading".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
