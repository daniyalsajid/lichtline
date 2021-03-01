import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import '../../providers/data_provider.dart';

class EconomicCalculator extends StatefulWidget {
  //
  EconomicCalculator() : super();

  final String title = "Charts Demo";

  @override
  EconomicCalculatorState createState() => EconomicCalculatorState();
}

class EconomicCalculatorState extends State<EconomicCalculator> {
  List<charts.Series> seriesList;
  DataProvider dataProvider;
  List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();
    var lichtLine = dataProvider.calculateEnergyCosting(dataProvider.lichtLine);
    var altLousung =
        dataProvider.calculateEnergyCosting(dataProvider.altLosung);
    // final desktopSalesData = [
    //   Sales('2015', random.nextInt(10)),
    //   Sales('2016', random.nextInt(10)),
    //   Sales('2017', random.nextInt(100)),
    //   Sales('2018', random.nextInt(100)),
    //   Sales('2019', random.nextInt(100)),
    // ];

    // final tabletSalesData = [
    //   Sales('2015', random.nextInt(10)),
    //   Sales('2016', random.nextInt(10)),
    //   Sales('2017', random.nextInt(100)),
    //   Sales('2018', random.nextInt(100)),
    //   Sales('2019', random.nextInt(100)),
    // ];

    // final mobileSalesData = [
    //   Sales('2015', random.nextInt(100)),
    //   Sales('2016', random.nextInt(100)),
    //   Sales('2017', random.nextInt(100)),
    //   Sales('2018', random.nextInt(100)),
    //   Sales('2019', random.nextInt(100)),
    // ];

    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: lichtLine,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.yellow.shadeDefault;
        },
      ),
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: altLousung,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.black;
        },
      ),
      // charts.Series<Sales, String>(
      //   id: 'Sales',
      //   domainFn: (Sales sales, _) => sales.year,
      //   measureFn: (Sales sales, _) => sales.sales,
      //   data: mobileSalesData,
      //   fillColorFn: (Sales sales, _) {
      //     return charts.MaterialPalette.teal.shadeDefault;
      //   },
      // )
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      barGroupingType: charts.BarGroupingType.groupedStacked,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    dataProvider = Provider.of<DataProvider>(context, listen: false);
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: barChart(),
      ),
    );
  }
}

class Sales {
  final String year;
  final double sales;

  Sales(this.year, this.sales);
}
