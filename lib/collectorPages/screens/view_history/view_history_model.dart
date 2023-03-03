import 'package:stacked/stacked.dart';

import '../../../services/records.dart';

class ViewHistoryModel extends BaseViewModel {
  String? phoneNumber;
  init(String? phoneNumberTmp) async {
    phoneNumber = phoneNumberTmp;
    setBusy(true);
    print(phoneNumber);
    await getMilkRecordsOfEachFarmer(phoneNumber ?? "0");
    setBusy(false);
    notifyListeners();
  }
}
