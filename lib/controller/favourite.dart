import 'package:get/get.dart';
import 'package:restaurant_app/data/firebase%20functions/delete_from_favorite.dart';
import 'package:restaurant_app/data/firebase%20functions/get_favourite_data.dart';
import 'package:restaurant_app/data/firebase%20functions/setdata_tofavourite.dart';

class FavoriteController extends GetxController {
  var favoriteData = [].obs;
  var loading = true.obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getFavoriteDataFun();
  }

  Future<void> getFavoriteDataFun() async {
    loading.value = true;
    try {
      favoriteData.value = await getFavoriteData();
      loading.value = false;
    } catch (e) {
      error.value = "there's something wrong";
    } finally {
      loading.value = false;
    }
  }

  Future<void> setFavoriteDataFun(
      String name, double price, String owner) async {
    loading.value = true;
    try {
      await dataToFavorite(name, price, owner);
      getFavoriteDataFun();
      loading.value = false;
    } catch (e) {
      error.value = "there's something wrong";
    } finally {
      loading.value = false;
    }
  }

  Future<void> deleteFavoriteDataFun(String name, String owner) async {
    loading.value = true;
    try {
      await deleteFromFavorite(name, owner);
      deleteFromFavorite(name, owner);
      getFavoriteDataFun();
      loading.value = false;
    } catch (e) {
      error.value = "there's something wrong";
    } finally {
      loading.value = false;
    }
  }
}
