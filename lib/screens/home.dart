import 'package:begennier_project/constants/app_constants.dart';
import 'package:begennier_project/widgets/left_bar.dart';
import 'package:begennier_project/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _bmi = 0;
  String _textResult = "";




  void updateBMI(double height, double weight) {
    setState(() {
      _bmi = weight/(height * height);

      if (_bmi > 25) {
        _textResult = "You're over weight";
      }else if ( _bmi >= 18.5) {
        _textResult = "You have normal weight";
      }else {
        _textResult = "You're under weight";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: accentHexColor,),
        ),
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: Center(
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor,

                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.5)
                          )
                      ),
                    ),
                  )
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masse",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.5)
                        )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Container(

              child: InkWell(
                onTap: () {
                  try {
                    double _height = double.parse(_heightController.text);
                    double _weight = double.parse(_weightController.text);

                    updateBMI(_height, _weight);
                  }catch (e) {
                    print("invalid height or weight");
                  }
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      color: accentHexColor
                  ),
                ),
              )
            ),
            SizedBox(height: 50,),
            Container(
              child: Text(
                _bmi.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 90,
                    color: accentHexColor
                  ),
              ),
            ),
            SizedBox(height: 30,),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor
                  ),
                ),
              )
            ),
            SizedBox(height: 10,),
            LeftBar(barWidth: 80),
            SizedBox(height: 20),
            LeftBar(barWidth: 170),
            SizedBox(height: 20,),
            LeftBar(barWidth: 40),
            
            SizedBox(height: 20,),
            
            RightBar(barWidth: 100),
            SizedBox(height: 20,),
            RightBar(barWidth: 30),
            SizedBox(height: 20,),
            RightBar(barWidth: 180),

            Container(
                child: Text(
                    _bmi.toStringAsFixed(2),
                    style: TextStyle(
                      color: accentHexColor,
                      fontWeight: FontWeight.w100
                    ),
                ),
            )
          ],
        ),
        
      )
    );
  }
}
