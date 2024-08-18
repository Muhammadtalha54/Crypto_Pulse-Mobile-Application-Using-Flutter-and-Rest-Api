import 'package:crypto_tracker_1/Model/cryptochart/OHLCchartmodel.dart';
import 'package:crypto_tracker_1/Repositories/cryptocahrtrepo.dart';
import 'package:get/get.dart';

import '../../../Data/Responce/Status.dart';

class Chartscontroller extends GetxController {
  final _api = CryptoChart_Repository();

  RxList<OHLC_chart_model> Chartdata = <OHLC_chart_model>[].obs;

  RxBool isloading = true.obs;
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  void seterror(String _value) => error.value = _value;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  RxBool isLoading = true.obs;

  Future<void> fetchchartdata(String name) async {
    isLoading.value = true;
    try {
      List<List<dynamic>> _chartdata = await _api.getChartdata(name);
      print(name);

      // print('chartdata data: $_chartdata');

      List<OHLC_chart_model> data = _chartdata.map((list) {
        return OHLC_chart_model.fromList(list);
      }).toList();

      // print('data');
      //print('Converted data: $data');

      Chartdata.value = data;

      setRxRequestStatus(Status.COMPLETED);
    } catch (e) {
      // print(e);
      setRxRequestStatus(Status.ERROR);
      print("error occured");
     // Chartdata.value = [];
    } finally {
      isLoading.value = false;
    }
  }
}
