import 'dart:html';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EquilibriumTrayOut extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  EquilibriumTrayOut(
      {@required this.y2,
      @required this.xo,
      @required this.gs,
      @required this.gl,
      @required this.y1,
      @required this.m,
      @required this.e,
      @required this.a,
      @required this.b,
      @required this.c,
      @required this.d,
      @required this.co});
  final double y2;
  final double xo;
  final double gs;
  final double gl;
  final double y1;
  final double m;
  final double e;
  final a;
  final double b;
  final double c;
  final double d;
  final int co;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(
          y2: y2,
          xo: xo,
          gs: gs,
          gl: gl,
          y1: y1,
          m: m,
          e: e,
          a: a,
          b: b,
          c: c,
          d: d,
          co: co),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage(
      {Key key,
      @required this.y2,
      @required this.xo,
      @required this.gs,
      @required this.gl,
      @required this.y1,
      @required this.m,
      @required this.e,
      @required this.a,
      @required this.b,
      @required this.c,
      @required this.d,
      @required this.co})
      : super(key: key);
  final double y2;
  final double xo;
  final double gs;
  final double gl;
  final double y1;
  final double m;
  final double e;
  final a;
  final double b;
  final double c;
  final double d;
  final int co;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_ChartData1> chartData1 = [];
  List<_ChartData2> chartData2 = [];
  List<_ChartData3> chartData3 = [];
  @override
  Widget build(BuildContext context) {
    double ew = widget.e;
    double y2w = widget.y2;
    double xow = widget.xo;
    double gsw = widget.gs;
    double glw = widget.gl;
    double y1w = widget.y1;
    List aw = widget.a;
    double bw = widget.b;
    double cw = widget.c;
    double dw = widget.d;
    int cow = widget.co;
    int mw = widget.m.toInt();
    double cy2;
    double cy1;
    cy2 = y2w / (100 - y2w);

    cy1 = cy2 * (y1w / 100);

    double cgs = gsw * (1 - (y2w / 100));
    double cgl = glw * (1 - (xow / 100));
    double cxo = xow / (100 - xow);
    double cxn = ((cgs * (cy2 - cy1)) / cgl) + cxo;
    double cxd = cxo;
    double cyd = cy1;
    chartData3.add(_ChartData3(cxd, cyd));
    var v = new List.generate(mw, (_) => new List(2));
    v = aw;
    int j1 = 0;

    double j = 0;
    double f1(double x) {
      chartData3.add(_ChartData3(x, (x - cxo) * cgl / cgs + cy1));
      return (x - cxo) * cgl / cgs + cy1;
    }

    double res;
    double f2(double y) {
      for (int i = 0; i < mw; i++) {
        if (y <= v[i][1]) {
          chartData3.add(_ChartData3(
              ((y - v[i - 1][1]) *
                      (v[i][0] - v[i - 1][0]) /
                      (v[i][1] - v[i - 1][1])) +
                  v[i - 1][0],
              y));
          res = ((y - v[i - 1][1]) *
                  (v[i][0] - v[i - 1][0]) /
                  (v[i][1] - v[i - 1][1])) +
              v[i - 1][0];
          print(res);
          i = 10;
        } else {
          res = cxn;
        }
      }
      return res;
    }

    int p;
    for (int i = 1;; i++) {
      if (i % 2 != 0) {
        cyd = f1(cxd);
      } else {
        cxd = f2(cyd);
      }
      j = j + 0.5;
      if (cxd >= cxn || cyd >= cy2) {
        p = ((((j).ceil()) / ew).ceil());
        print(p);
        break;
      }
    }
    for (int k = 0; k < mw; k++) {
      chartData1.add(_ChartData1(v[k][0], v[k][1]));
    }
    print(p);
    for (double l = 0; l <= cxn;) {
      l = l + 0.0001;
      chartData2.add(_ChartData2(l, (cgl * (l - cxo)) / cgs + cy1));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Result'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 100,
                child: Text(
                  'Number of Trays=' + p.toString(),
                  style: TextStyle(fontSize: 30),
                )),
            Container(
              height: 500,
              child: SfCartesianChart(
                  zoomPanBehavior: ZoomPanBehavior(
                      // Enables pinch zooming
                      enablePinching: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries>[
                    SplineSeries<_ChartData1, double>(
                      dataSource: chartData1,
                      xValueMapper: (_ChartData1 sales, _) => sales.xcomp,
                      yValueMapper: (_ChartData1 sales, _) => sales.sales,
                    ),
                    SplineSeries<_ChartData2, double>(
                      dataSource: chartData2,
                      xValueMapper: (_ChartData2 sales, _) => sales.xcomp,
                      yValueMapper: (_ChartData2 sales, _) => sales.sales,
                    ),
                    LineSeries<_ChartData3, double>(
                      dataSource: chartData3,
                      xValueMapper: (_ChartData3 sales, _) => sales.xcomp,
                      yValueMapper: (_ChartData3 sales, _) => sales.sales,
                    )
                  ]),
            ),
            // Expanded(

            // )
          ],
        ));
  }
}

class _ChartData1 {
  _ChartData1(this.xcomp, this.sales);

  double xcomp;
  double sales;
}

class _ChartData2 {
  _ChartData2(this.xcomp, this.sales);

  double xcomp;
  double sales;
}

class _ChartData3 {
  _ChartData3(this.xcomp, this.sales);

  double xcomp;
  double sales;
}

void fn(double cgs) {
  print(cgs);
}
