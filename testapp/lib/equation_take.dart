import 'package:flutter/material.dart';
import 'package:testapp/polynomial_tray_out.dart';

class MyAppEquation extends StatelessWidget {
  MyAppEquation(
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
  final String m;
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
  final String m;
  final double e;
  final int c;
  final int n;
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _a = TextEditingController();
  final _b = TextEditingController();
  final _c = TextEditingController();
  final _d = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double ey2 = widget.y2;
    double exo = widget.xo;
    double egs = widget.gs;
    double egl = widget.gl;
    double ey1 = widget.y1;
    String em = widget.m;
    double ee = widget.e;
    if (em == 'e') {
      return Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/exponential.PNG',
                scale: 0.3,
              ),
              TextFormField(
                controller: _a,
                decoration: const InputDecoration(
                  hintText: 'Value of A',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _b,
                decoration: const InputDecoration(
                  hintText: 'Value of B',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PolyTrayOut(
                                  y2: ey2,
                                  xo: exo,
                                  gs: egs,
                                  gl: egl,
                                  y1: ey1,
                                  m: 1.3,
                                  e: ee,
                                  a: double.parse(_a.text),
                                  b: double.parse(_b.text),
                                  c: 0,
                                  d: 0,
                                  co: 2)),
                        );
                      }
                    },
                    child: Text('Submit'),
                  ))
            ],
          ),
        ),
      );
    } else if (em == 'p') {
      return MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/polynomial.PNG',
                  scale: 0.3,
                ),
                TextFormField(
                  controller: _a,
                  decoration: const InputDecoration(
                    hintText: 'Value of A',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _b,
                  decoration: const InputDecoration(
                    hintText: 'Value of B',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _c,
                  decoration: const InputDecoration(
                    hintText: 'Value of C',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _d,
                  decoration: const InputDecoration(
                    hintText: 'Value of D',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PolyTrayOut(
                                    y2: ey2,
                                    xo: exo,
                                    gs: egs,
                                    gl: egl,
                                    y1: ey1,
                                    m: 1.3,
                                    e: ee,
                                    a: double.parse(_a.text),
                                    b: double.parse(_b.text),
                                    c: double.parse(_c.text),
                                    d: double.parse(_d.text),
                                    co: 0)),
                          );
                        }
                      },
                      child: Text('Submit'),
                    ))
              ],
            ),
          ),
        ),
      ));
    } else {
      return MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/ratio.PNG',
                  scale: 0.3,
                ),
                TextFormField(
                  controller: _a,
                  decoration: const InputDecoration(
                    hintText: 'Value of A',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _b,
                  decoration: const InputDecoration(
                    hintText: 'Value of B',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _c,
                  decoration: const InputDecoration(
                    hintText: 'Value of C',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _d,
                  decoration: const InputDecoration(
                    hintText: 'Value of D',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.

                        if (_formKey.currentState.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PolyTrayOut(
                                    y2: ey2,
                                    xo: exo,
                                    gs: egs,
                                    gl: egl,
                                    y1: ey1,
                                    m: 1.3,
                                    e: ee,
                                    a: double.parse(_a.text),
                                    b: double.parse(_b.text),
                                    c: double.parse(_c.text),
                                    d: double.parse(_d.text),
                                    co: 1)),
                          );
                        }
                      },
                      child: Text('Submit'),
                    ))
              ],
            ),
          ),
        ),
      ));
    }
  }
}
