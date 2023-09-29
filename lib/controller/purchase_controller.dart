import 'dart:async';

import 'package:fight_number/controller/base_controller.dart';
import 'package:fight_number/model/purchase/purchasable_product.dart';
import 'package:fight_number/model/purchase/purchase_enum.dart';
import 'package:fight_number/values/constants.dart';
import 'package:fight_number/views/purchase/ipa_connection.dart';
import 'package:fight_number/views/purchase/purchase_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchaseController extends BaseController {
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  final iapConnection = IAPConnection.instance;
  var products = <PurchasableProduct>[].obs;
  var storeState = StoreState.loading.obs;

  @override
  void onInit() {
    super.onInit();
    final purchaseUpdated = iapConnection.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _onPurchaseUpdate,
      onDone: _updateStreamOnDone,
      onError: _updateStreamOnError,
    );
    InAppPurchase.instance.restorePurchases();
    // iapConnection.completePurchase(purchase)
  }

  Future<void> loadPurchases() async {
    final available = await iapConnection.isAvailable();
    if (!available) {
      storeState.value = StoreState.notAvailable;
      return;
    }

    final response =
        await iapConnection.queryProductDetails({Constants.appSubscription});
    products.clear();
    products.addAll(
        response.productDetails.map((e) => PurchasableProduct(e)).toList());
    storeState.value = StoreState.available;

    showModalBottomSheet(
        context: Get.context!,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        builder: (context) {
          return PurchasePage();
        });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  Future<void> buy(PurchasableProduct product) async {
    final purchaseParam = PurchaseParam(productDetails: product.productDetails);
    await iapConnection.buyNonConsumable(purchaseParam: purchaseParam);
  }

  void _onPurchaseUpdate(List<PurchaseDetails> purchaseDetailsList) {
    print("MUA XONG GOIIIIIIIIIIIIIIIIII");
    print("MUA XONG GOIIIIIIIIIIIIIIIIII");
    var a = purchaseDetailsList;

    // var json = jsonEncode(purchaseDetailsList[0]);

    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // _showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          // _handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          // bool valid = await _verifyPurchase(purchaseDetails);
          // if (valid) {
          // _deliverProduct(purchaseDetails);
          // } else {
          // _handleInvalidPurchase(purchaseDetails);
          // }

          print("DA MUA GOI NE");
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    });
  }

  void _updateStreamOnDone() {
    _subscription.cancel();
  }

  void _updateStreamOnError(dynamic error) {
    //Handle error here
  }
}
