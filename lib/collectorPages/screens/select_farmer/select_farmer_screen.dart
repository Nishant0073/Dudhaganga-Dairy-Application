import 'package:dudhaganga_app/collectorPages/screens/select_farmer/select_farmer_model.dart';
import 'package:dudhaganga_app/customWidgets/ddd_loading.dart';
import 'package:flutter/material.dart';
import 'package:dudhaganga_app/customWidgets/c_card.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class SelectFarmer extends StatefulWidget {
  final Function? onUserSelection;
  final bool? isMilkBuyer;
  const SelectFarmer({Key? key, this.onUserSelection, this.isMilkBuyer})
      : super(key: key);

  @override
  State<SelectFarmer> createState() => _SelectFarmerState();
}

class _SelectFarmerState extends State<SelectFarmer> {
  //created mvvm
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectFarmerModel>.reactive(
        viewModelBuilder: () => SelectFarmerModel(),
        onViewModelReady: (model) => model.init(widget.isMilkBuyer ?? false),
        builder: (context, model, child) => _body(context, model));
  }

  //body of widget which represent screen.
  Widget _body(BuildContext context, SelectFarmerModel model) {
    return Scaffold(
      appBar: AppBar(
        title: model.isMilkBuyer
            ? Text('select_milk_buyer'.tr)
            : Text('select_farmer'.tr),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: model.isMilkBuyer
                ? model.milkBuyers.length
                : model.farmers.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: HomeCard(
                  child: model.isMilkBuyer
                      ? ListTile(
                          title: Text(model.milkBuyers[index].name ??
                              "milk buyer Name"),
                          subtitle: Text(
                              model.milkBuyers[index].phoneNumber.toString()),
                          leading: const Icon(Icons.person),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {
                              widget.onUserSelection
                                  ?.call(model.milkBuyers[index]);
                            },
                          ),
                        )
                      : ListTile(
                          title:
                              Text(model.farmers[index].name ?? "Farmer Name"),
                          subtitle:
                              Text(model.farmers[index].phoneNumber.toString()),
                          leading: const Icon(Icons.person),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {
                              widget.onUserSelection
                                  ?.call(model.farmers[index]);
                            },
                          ),
                        ),
                ),
              );
            },
          ),
          DDLoader(
            loading: model.isBusy,
          ),
        ],
      ),
    );
  }
}
