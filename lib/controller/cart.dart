import 'package:get/get.dart';
import 'package:restaurant_app/data/firebase%20functions/delete_completed_items.dart';
import 'package:restaurant_app/data/firebase%20functions/delete_from_cart.dart';
import 'package:restaurant_app/data/firebase%20functions/get_all_cart.dart';
import 'package:restaurant_app/data/firebase%20functions/get_cart_data.dart';
import 'package:restaurant_app/data/firebase%20functions/setdata_tocart.dart';

class CartController extends GetxController {
  var carteData = [].obs;
  var loading = true.obs;
  var error = ''.obs;

  Future<void> getCartDataFun() async {
    loading.value = true;
    try {
      carteData.value = await getCartData();
      loading.value = false;
    } catch (e) {
      error.value = "there's something wrong";
    } finally {
      loading.value = false;
    }
  }

  Future<void> getCartDataFunForAdmin() async {
    loading.value = true;
    try {
      carteData.value = await getCartDataAdmin();
      loading.value = false;
    } catch (e) {
      error.value = "$e";
    } finally {
      loading.value = false;
    }
  }

  Future<void> setCartDataFun(String name, double price, totalPrice,
      String owner, count, phone, uid) async {
    loading.value = true;
    try {
      await dataToCart(name, price, totalPrice, owner, count, phone, uid);
      loading.value = false;
    } catch (e) {
      error.value = "there's something wrong";
    } finally {
      loading.value = false;
    }
  }

  Future<void> deleteCartDataFun(
      name, price, totalPrice, owner, count, phone, uid) async {
    loading.value = true;
    try {
      await deleteFromCart(name, price, totalPrice, owner, count, phone, uid);
      await getCartDataFun();
      loading.value = false;
    } catch (e) {
      error.value = "there's something wrong";
    } finally {
      loading.value = false;
    }
  }

  Future<void> deleteCartDataForAdminFun(
      name, price, totalPrice, owner, count, phone, uid) async {
    loading.value = true;
    try {
      await completeCartItem(name, price, totalPrice, owner, count, phone, uid);
      await getCartDataFunForAdmin();
      loading.value = false;
    } catch (e) {
      error.value = "there's something wrong";
    } finally {
      loading.value = false;
    }
  }
}
