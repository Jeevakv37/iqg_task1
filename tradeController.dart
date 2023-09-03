import '../../../../allpackages.dart';

class TradeController extends GetxController {
  List<PriceData> priceData = [];
  double currentPrice = 100.0; // Initial price
  Timer? dataGenerator;

  void autoGentrateTradePrice() {
    dataGenerator = Timer.periodic(Duration(seconds: 1), (timer) {
      update(['autoUpdate']);
      currentPrice += Random().nextDouble() - 0.5;
      priceData.add(PriceData(
        priceData.length.toDouble(),
        currentPrice,
        currentPrice - 2.0,
        currentPrice + 2.0,
        currentPrice - 1.0,
        currentPrice + 1.0,
      ));
      if (priceData.length > 20) {
        priceData.removeAt(0);
      }
    });
    update(['autoUpdate']);
  }

  // @override
  // void dispose() {
  //   dataGenerator!.cancel();
  //   super.dispose();
  // }
}
