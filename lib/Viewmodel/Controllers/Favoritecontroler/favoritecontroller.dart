import 'package:crypto_tracker_1/Model/Home/Cryptolistmodel.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/Cryptolist_controller/cryptolistcontroller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class favoroitecontroller extends GetxController {
   final  cryptolist=Get.put(cryptolistcontroller());
 static RxList favoriteslist = <String>[].obs;
  RxList<Crypto_list_model> favoitecryptos = <Crypto_list_model>[].obs;

static  Future<bool> addtofavorite(String id) async {
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();

    List<String> storedFavorites =
        sharedpreferences.getStringList("favoriteslist") ?? [];
    favoriteslist.assignAll(storedFavorites);

    // favoriteslist.add(id);

    favoriteslist.add(id);
    return await sharedpreferences.setStringList(
        "favoriteslist", List<String>.from(favoriteslist));
  }


 static Future<bool> removefromfavorite(String id) async {
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();

    List<String> storedFavorites =
        sharedpreferences.getStringList("favoriteslist") ?? [];
    favoriteslist.assignAll(storedFavorites);

    // favoriteslist.add(id);

    favoriteslist.remove(id);
    return await sharedpreferences.setStringList(
        "favoriteslist", List<String>.from(favoriteslist));
  }


 static Future<List<String>>Fetchfavorites  ()async{
      SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
     return sharedpreferences.getStringList("favoriteslist")??[];

  }
  
  
RxList<Crypto_list_model> fetch_favoriteslist() {
     favoitecryptos.value = cryptolist.Markets.where(
        (element) => element.isfavorite == true).toList();
        return favoitecryptos;
    
  }

 


  }



