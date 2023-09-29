import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fight_number/controller/purchase_controller.dart';
import 'package:fight_number/model/purchase/purchasable_product.dart';
import 'package:fight_number/model/purchase/purchase_enum.dart';
import 'package:fight_number/utils/utils.dart';

class PurchasePage extends StatelessWidget {
  PurchasePage({super.key});

  final PurchaseController purchaseController = Get.find<PurchaseController>();

  @override
  Widget build(BuildContext context) {
    // var firebaseNotifier = context.watch<FirebaseNotifier>();
    // if (firebaseNotifier.state == FirebaseState.loading) {
    //   return _PurchasesLoading();
    // } else if (firebaseNotifier.state == FirebaseState.notAvailable) {
    //   return _PurchasesNotAvailable();
    // }
    //
    // if (!firebaseNotifier.loggedIn) {
    //   return const LoginPage();
    // }
    //
    // var upgrades = context.watch<DashPurchases>();
    return Container(
      height: Utils.getHeight() / 2,
      child: SingleChildScrollView(
        child: Obx(
          () {
            Widget storeWidget;
            switch (purchaseController.storeState.value) {
              case StoreState.loading:
                storeWidget = _PurchasesLoading();
                break;
              case StoreState.available:
                storeWidget = _PurchaseList();
                break;
              case StoreState.notAvailable:
                storeWidget = _PurchasesNotAvailable();
            }
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  storeWidget,
                  const Padding(
                    padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0.0),
                    child: Text(
                      'Past purchases',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const PastPurchasesWidget(),
                ]);
          },
        ),
      ),
    );
  }
}

class _PurchasesLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Store is loading'));
  }
}

class _PurchasesNotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Store not available'));
  }
}

class _PurchaseList extends StatelessWidget {
  final PurchaseController purchaseController = Get.find<PurchaseController>();

  @override
  Widget build(BuildContext context) {
    // var purchases = context.watch<DashPurchases>();
    return Container(
      color: Colors.white,
      child: Obx(() {
        var products = purchaseController.products;
        return Column(
          children: products
              .map((product) => _PurchaseWidget(
                  product: product,
                  onPressed: () {
                    purchaseController.buy(product);
                  }))
              .toList(),
        );
      }),
    );
  }
}

class _PurchaseWidget extends StatelessWidget {
  final PurchaseController purchaseController = Get.find<PurchaseController>();
  final PurchasableProduct product;
  final VoidCallback onPressed;

  _PurchaseWidget({
    required this.product,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var title = product.title;
    if (product.status == ProductStatus.purchased) {
      title += ' (purchased)';
    }
    return Material(
      color: Colors.white,
      child: InkWell(
          onTap: onPressed,
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              product.description,
              style: const TextStyle(color: Colors.black),
            ),
            trailing: Text(
              _trailing(),
              style: const TextStyle(color: Colors.black),
            ),
          )),
    );
  }

  String _trailing() {
    if (product.status == ProductStatus.purchasable) return product.price;
    if (product.status == ProductStatus.purchased) return 'purchased';
    if (product.status == ProductStatus.pending) return 'buying...';
    return '--';
  }
}

class PastPurchasesWidget extends StatelessWidget {
  const PastPurchasesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // var purchases = context.watch<IAPRepo>().purchases;
    var purchases = [];
    return ListView.separated(
      shrinkWrap: true,
      itemCount: purchases.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          purchases[index].title,
          style: const TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          purchases[index].status.toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
