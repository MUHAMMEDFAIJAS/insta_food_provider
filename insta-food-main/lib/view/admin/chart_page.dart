import 'package:fine_bar_chart/fine_bar_chart.dart';
import 'package:firstproject/controller/buy_now_provider.dart';
import 'package:firstproject/controller/cart_provider.dart';
import 'package:firstproject/controller/food_model_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarChart extends StatelessWidget {
  const BarChart({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> barColors = [Colors.blue, Colors.red, Colors.yellow];
    List<String> bottomBarName = [
      'total product ',
      'total cart ',
      'total buyed ',
    ];

    final totalpriceprovider = Provider.of<FoodProvider>(context);
    final totalcartprovider = Provider.of<CartProvider>(context);
    final totalbuyprovider = Provider.of<Buynowprovider>(context);

    List<double> barValue = [
      totalpriceprovider.totalprice1(),
      totalcartprovider.totalcartprice(),
      totalbuyprovider.totalpricebuy(),
    ];
    totalpriceprovider.getallproductsprovider();
    totalcartprovider.getallcartsprovider();
    totalbuyprovider.getallbuyprovider();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text(
            'CHART',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 60),
          child: FineBarChart(
              barWidth: 30,
              barHeight: 300,
              backgroundColors: Colors.white,
              isBottomNameDisable: false,
              isValueDisable: false,
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              barBackgroundColors: Colors.grey.withOpacity(0.3),
              barValue: barValue,
              barColors: barColors,
              barBottomName: bottomBarName),
        ));
  }
}
