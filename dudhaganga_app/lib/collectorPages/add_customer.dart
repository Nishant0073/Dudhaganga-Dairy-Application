import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddCustomers extends StatelessWidget {
  const AddCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Customer'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: []),
      ),
    );
  }
}
