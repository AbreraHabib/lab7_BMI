import 'package:flutter/material.dart';
import 'constant_material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ContainerCode.dart';
import 'IconTextColumnCode.dart';

enum Gender {
  male,
  female,
  Height,
  Weight,
  Age,
}
int sliderHeight = 180;
int sliderWeight = 60;
int sliderAge = 20;

class InputPages extends StatefulWidget {
  const InputPages({Key? key}) : super(key: key);

  @override
  State<InputPages> createState() => _InputPagesState();
}

class _InputPagesState extends State<InputPages> {
  Color maleColor = deActiveColor;
  Color feMaleColor = deActiveColor;
  void UpdateColor(Gender gendertype) {
    if (gendertype == Gender.male) {
      maleColor = activeColor;
      feMaleColor = deActiveColor;
    } else if (gendertype == Gender.female) {
      feMaleColor = activeColor;
      maleColor = deActiveColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("BMI Calculator Application")),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          UpdateColor(Gender.male);
                        });
                      },
                      child: ContainerCode(
                        colors: maleColor,
                        cardWidget: IconTextColumnCode(
                          icon: FontAwesomeIcons.mars,
                          text: "Male",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          UpdateColor(Gender.female);
                        });
                      },
                      child: ContainerCode(
                        colors: feMaleColor,
                        cardWidget: IconTextColumnCode(
                          icon: FontAwesomeIcons.venus,
                          text: "Female",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ContainerCode(
                colors: KContainterColor,
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: KTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sliderHeight.toString(),
                          style: KNumStyle,
                        ),
                        Text(
                          'cm',
                          style: KTextStyle,
                        )
                      ],
                    ),
                    Slider(
                      value: sliderHeight.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          sliderHeight = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ContainerCode(
                      colors: KContainterColor,
                      cardWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: KTextStyle,
                          ),
                          Text(
                            sliderWeight.toString(),
                            style: KNumStyle,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyFloatingActionButton(
                                  icons: Icon(FontAwesomeIcons.plus),
                                  onpress: () {
                                    setState(() {
                                      sliderWeight++;
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              MyFloatingActionButton(
                                  icons: Icon(FontAwesomeIcons.minus),
                                  onpress: () {
                                    setState(() {
                                      if (sliderWeight > 0) {
                                        sliderWeight = sliderWeight - 1;
                                      }
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ContainerCode(
                      colors: KContainterColor,
                      cardWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: KTextStyle,
                          ),
                          Text(
                            sliderAge.toString(),
                            style: KNumStyle,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyFloatingActionButton(
                                  icons: Icon(FontAwesomeIcons.plus),
                                  onpress: () {
                                    setState(() {
                                      sliderAge++;
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              MyFloatingActionButton(
                                  icons: Icon(FontAwesomeIcons.minus),
                                  onpress: () {
                                    setState(() {
                                      if (sliderAge > 0) {
                                        sliderAge = sliderAge - 1;
                                      }
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              color: kcontainerColor,
              height: 80.0,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  MyFloatingActionButton({required this.icons, required this.onpress});
  final Icon icons;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: onpress,
      child: icons,
      backgroundColor: KFloatingActionButtoncolor,
    );
  }
}
