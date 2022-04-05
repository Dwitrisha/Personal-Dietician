import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _infoText = 'Enter your Data ';

  void _resetFields() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _infoText = 'Enter your Data ';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      var weight = double.parse(weightController.text);
      var height = double.parse(heightController.text) / 100;
      var imc = weight / (height * height);
      print(imc);
      if (imc < 18.6) {
        _infoText = 'BMI: ${imc.toStringAsPrecision(4)} (Under Weight)';
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = 'BMI: ${imc.toStringAsPrecision(4)} (Ideal Weight)';
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = 'BMI: ${imc.toStringAsPrecision(4)} (Slightly Obese)';
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = 'BMI: ${imc.toStringAsPrecision(4)} (Grade I Obesity)';
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = 'BMI: ${imc.toStringAsPrecision(4)} (Grade II Obesity)';
      } else if (imc >= 40) {
        _infoText = 'BMI:${imc.toStringAsPrecision(4)} (Grade III Obesity)';
      }
    });
  }

  static const _colorDefault = Color(0xFF21e6c1);
  static const _colorFields = Color(0xFF393e46);
  static const _colorBackground = Color(0xFF222831);
  static const _colorLight = Color(0xFFe4f9ff);

  final kLabelStyle = TextStyle(
    color: _colorDefault,
    fontWeight: FontWeight.bold,
    fontSize: 26,
  );

  final kLightLabelStyle = TextStyle(
    color: _colorLight,
    fontSize: 20,
  );

  final kBoxDecorationStyle = BoxDecoration(
    color: _colorFields,
    borderRadius: BorderRadius.circular(50),
    boxShadow: [
      BoxShadow(color: _colorDefault, spreadRadius: .2),
    ],
  );

  final _snackBar = SnackBar(
    backgroundColor: _colorDefault,
    duration: Duration(seconds: 3),
    content: Text(
      "Check if all fields are filled",
      style: TextStyle(
        color: _colorLight,
        fontSize: 18,
      ),
    ),
  );

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildSizedBox() => Divider(
        color: _colorDefault,
        thickness: 1.5,
        indent: 75,
        endIndent: 75,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: _colorBackground,
      appBar: AppBar(
        title: Text('BMI calculator'),
        centerTitle: true,
        backgroundColor: _colorFields,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh, color: _colorDefault),
            onPressed: _resetFields,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person,
                size: 100,
                color: _colorLight,
              ),
              _buildSizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 16),
                  Text(
                    'Weight (kg)',
                    style: kLabelStyle,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                    decoration: kBoxDecorationStyle,
                    child: TextFormField(
                      style: kLightLabelStyle,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(border: InputBorder.none),
                      controller: weightController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height (cm)',
                    style: kLabelStyle,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                    decoration: kBoxDecorationStyle,
                    child: TextFormField(
                      style: kLightLabelStyle,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(border: InputBorder.none),
                      controller: heightController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              _buildSizedBox(),
              SizedBox(height: 16),
              Container(
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: _colorFields,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(
                        width: 1.5,
                        color: _colorDefault,
                      ),
                    ),
                  ),
                  child: Text(
                    'Calculate',
                    style: kLabelStyle,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _calculate();
                    }
                  },
                ),
              ),
              SizedBox(height: 24),
              Text(
                _infoText,
                style: kLabelStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
