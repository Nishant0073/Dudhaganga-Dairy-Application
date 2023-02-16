import 'package:dudhaganga_app/collectorPages/screens/select_farmer/select_farmer_model.dart';
import 'package:dudhaganga_app/customWidgets/ddd_loading.dart';
import 'package:flutter/material.dart';
import 'package:dudhaganga_app/customWidgets/c_card.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import '../take_readings/take_readings_view.dart';

class SelectFarmer extends StatefulWidget {
  const SelectFarmer({Key? key}) : super(key: key);

  @override
  State<SelectFarmer> createState() => _SelectFarmerState();
}

class _SelectFarmerState extends State<SelectFarmer> {
  //created mvvm
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectFarmerModel>.reactive(
        viewModelBuilder: () => SelectFarmerModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => _body(context, model));
  }

  //body of widget which represent screen.
  Widget _body(BuildContext context, SelectFarmerModel model) {
    return Scaffold(
      appBar: AppBar(
        title: Text('select_farmer'.tr),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: model.farmers.length,
            itemBuilder: (_, index) {
              return HomeCard(
                  child: ListTile(
                title: Text(model.farmers[index].name ?? "Farmer Name"),
                subtitle: Text(model.farmers[index].phoneNumber.toString()),
                leading: const Icon(Icons.person),
                trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              MilkReading(model.farmers[index]),
                        ),
                      );
                    }),
              ));
            },
          ),
          DDLoader(
            loading: model.isBlank,
          ),
        ],
      ),
    );
  }
}
