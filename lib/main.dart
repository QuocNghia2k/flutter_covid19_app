import 'package:flutter/material.dart';
import 'package:flutter_covid19_app/constant.dart';
import 'package:flutter_covid19_app/info_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/counter.dart';
import 'widgets/my_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: kBodyTextColor),
          )),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: <Widget>[
        const MyHeader(
          image: "assets/icons/Drcorona.svg",
          textTop: "All you need",
          textBottom: "is stay at home",
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.black)),
          child: Row(
            children: [
              SvgPicture.asset("assets/icons/maps-and-flags.svg"),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: DropdownButton(
                      isExpanded: true,
                      underline: const SizedBox(),
                      value: 'Indonesia',
                      items: [
                        'Indonesia',
                        'Bangladesh',
                        'United states',
                        'Japan'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) {}))
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(text: "Case Update\n", style: kTitleTextstyle),
                        TextSpan(
                            text: "Newest Update Match 28",
                            style: TextStyle(color: kTextLightColor))
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "See details",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 20,
                          color: kShadowColor)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Counter(
                        number: 1223, color: kInfectedColor, title: "Infected"),
                    Counter(number: 834, color: kDeathColor, title: "Deaths"),
                    Counter(
                        number: 123, color: kRecovercolor, title: "Recovered")
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "Spread of Virus",
              style: kTitleTextstyle,
            ),
            // Spacer(),
            Text(
              "See details",
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(20),
          height: 178,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 30,
                    color: kShadowColor)
              ]),
          child: Image.asset(
            "assets/images/map.png",
            fit: BoxFit.contain,
          ),
        )
      ]),
    ));
  }
}
