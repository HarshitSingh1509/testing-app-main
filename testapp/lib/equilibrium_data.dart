import 'package:flutter/material.dart';
import 'package:testapp/equilibrium_tray_out.dart';

class MyAppEquilibrium extends StatelessWidget {
  MyAppEquilibrium(
      {@required this.y2,
      @required this.xo,
      @required this.gs,
      @required this.gl,
      @required this.y1,
      @required this.m,
      @required this.e,
      @required this.c,
      @required this.n});
  final double y2;
  final double xo;
  final double gs;
  final double gl;
  final double y1;
  final double m;
  final double e;
  final int c;
  final int n;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic TextFormFields',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyForm(
          y2: y2, xo: xo, gs: gs, gl: gl, y1: y1, m: m, e: e, n: n, c: c),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyForm extends StatefulWidget {
  MyForm(
      {Key key,
      @required this.y2,
      @required this.xo,
      @required this.gs,
      @required this.gl,
      @required this.y1,
      @required this.m,
      @required this.e,
      @required this.c,
      @required this.n})
      : super(key: key);
  final double y2;
  final double xo;
  final double gs;
  final double gl;
  final double y1;
  final double m;
  final double e;
  final int c;
  final int n;
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double ey2 = widget.y2;
    double exo = widget.xo;
    double egs = widget.gs;
    double egl = widget.gl;
    double ey1 = widget.y1;
    double em = widget.m;
    double ee = widget.e;
    int ec = widget.c;
    int n = widget.n;
    int o = em.toInt();
    var t;

    if (n == 50) {
      em = 13;
      n = 13;
      t = new List.generate(n, (_) => new List(2));
      t = [
        [0.00, 0.00],
        [0.005, 0.009],
        [0.009, 0.011],
        [0.011, 0.014],
        [0.013, 0.017],
        [0.015, 0.02],
        [0.018, 0.024],
        [0.029, 0.038],
        [0.039, 0.051],
        [0.051, 0.66],
        [0.066, 0.080],
        [0.075, 0.098],
        [0.093, 0.121],
      ];
    } else {
      n = widget.n;
      t = new List.generate(n, (_) => new List(2));
    }
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Data Values'),
        ),
        body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // name textfield
                            if (o == 50)
                              for (int i = 0; i < n; i++)
                                Padding(
                                    padding: const EdgeInsets.only(right: 32.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: TextFormField(
                                            initialValue: t[i][0].toString(),
                                            onSaved: (String value) {
                                              t[i][0] = double.parse(value);
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'enter x'),
                                            validator: (v) {
                                              if (v.trim().isEmpty)
                                                return 'Please enter something';
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Container(
                                          width: 100,
                                          child: TextFormField(
                                            initialValue: t[i][1].toString(),
                                            onSaved: (String value) {
                                              t[i][1] = double.parse(value);
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'enter y'),
                                            validator: (v) {
                                              if (v.trim().isEmpty)
                                                return 'Please enter something';
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                            if (o != 50)
                              for (int i = 0; i < n; i++)
                                Padding(
                                    padding: const EdgeInsets.only(right: 32.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: TextFormField(
                                            onSaved: (String value) {
                                              t[i][0] = double.parse(value);
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'enter x'),
                                            validator: (v) {
                                              if (v.trim().isEmpty)
                                                return 'Please enter something';
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Container(
                                          width: 100,
                                          child: TextFormField(
                                            onSaved: (String value) {
                                              t[i][1] = double.parse(value);
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'enter y'),
                                            validator: (v) {
                                              if (v.trim().isEmpty)
                                                return 'Please enter something';
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    )),

                            SizedBox(
                              height: 40,
                            ),
                            TextButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EquilibriumTrayOut(
                                                y2: ey2,
                                                gs: egs,
                                                gl: egl,
                                                xo: exo,
                                                m: em,
                                                y1: ey1,
                                                e: ee,
                                                a: t,
                                                b: 0,
                                                c: 0,
                                                d: 0,
                                                co: 0)),
                                  );
                                }
                              },
                              child: Text('Submit'),
                              //color: Colors.green,
                            ),
                          ])),
                ))));
  }
}
