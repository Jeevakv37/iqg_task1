import '../../../../allpackages.dart';

class Trading extends StatefulWidget {
  const Trading({Key? key}) : super(key: key);

  @override
  State<Trading> createState() => _TradingState();
}

class _TradingState extends State<Trading> {
  final tradeController = Get.put(TradeController());

  @override
  void initState() {
    super.initState();
    tradeController.autoGentrateTradePrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-time Candlestick Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<TradeController>(
            id: 'autoUpdate',
            builder: (_) {
              return Column(
                children: [
                  Expanded(
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <CandleSeries<PriceData, String>>[
                        CandleSeries<PriceData, String>(
                          dataSource: tradeController.priceData,
                          xValueMapper: (PriceData data, _) =>
                              data.time.toString(),
                          lowValueMapper: (PriceData data, _) => data.low,
                          highValueMapper: (PriceData data, _) => data.high,
                          openValueMapper: (PriceData data, _) => data.open,
                          closeValueMapper: (PriceData data, _) => data.close,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                      'Current Price: ${tradeController.currentPrice.toStringAsFixed(2)}'),
                ],
              );
            }),
      ),
    );
  }
}
