import 'package:crypto_tracker_1/Data/Responce/Status.dart';
import 'package:crypto_tracker_1/Model/Home/Cryptolistmodel.dart';
import 'package:crypto_tracker_1/Repositories/Crypto_list_repo.dart';
import 'package:get/get.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/Favoritecontroler/favoritecontroller.dart';

class cryptolistcontroller extends GetxController {
  cryptolistcontroller() {
    fetchdata();
  }

  final _api = Cryptolist_Repository();
  var cryptoDetails = Crypto_list_model().obs;
  RxList<Crypto_list_model> Markets = <Crypto_list_model>[].obs;

  RxBool isloading = true.obs;
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;

  void seterror(String _value) => error.value = _value;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  Future<void> fetchdata() async {
    try {
      List<dynamic> _markets = await _api.getMarkets();

      List<dynamic> favorites = await favoroitecontroller.Fetchfavorites();

      RxList<Crypto_list_model> temp = <Crypto_list_model>[].obs;
      for (var market in _markets) {
        Crypto_list_model newcrypto = Crypto_list_model.fromJson(market);

        if (favorites.contains(newcrypto.id!)) {
          newcrypto.isfavorite.value = true;
        }
        temp.add(newcrypto);
      }
      Markets = temp;

      setRxRequestStatus(Status.COMPLETED);
      //     Timer(const Duration(milliseconds: 1300), () {
      //       fetchdata();
      //       if (kDebugMode) {
      //         print("data fetched");
      //       }
      //     });
    } catch (e) {
      print(e);

      setRxRequestStatus(Status.ERROR);
    }
  }

  Crypto_list_model fetch_crypto_by_id(String id) {
    Crypto_list_model crypto =
        Markets.where((element) => element.id == id).toList()[0];
    cryptoDetails.value = crypto;
    return crypto;
  }
  //fetch favorrites

  void addfavorite(Crypto_list_model crypto) async {
    int indexofcrypto = Markets.indexOf(crypto);
    Markets[indexofcrypto].isfavorite.value = true;
    await favoroitecontroller.addtofavorite(crypto.id!);
  }

  void removefavorite(Crypto_list_model crypto) async {
    int indexofcrypto = Markets.indexOf(crypto);
    Markets[indexofcrypto].isfavorite.value = false;
    await favoroitecontroller.removefromfavorite(crypto.id!);
  }
}







