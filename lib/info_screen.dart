import 'package:flutter/material.dart';
import 'package:flutter_covid19_app/constant.dart';
import 'package:flutter_covid19_app/widgets/my_header.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Get to know",
              textBottom: "About COVID-19.",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Symptoms",
                    style: kTitleTextstyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SymbtomCard(
                        image: "assets/images/headache.png",
                        title: "Headache",
                        isActive: true,
                      ),
                      SymbtomCard(
                        image: "assets/images/caugh.png",
                        title: "Caugh",
                      ),
                      SymbtomCard(
                        image: "assets/images/fever.png",
                        title: "Fever",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Prevention",
                    style: kTitleTextstyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PrevenCard(
                    image: "assets/images/wash_hands.png",
                    title: "Wash face hands",
                    text:
                        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  ),
                  const PrevenCard(
                    image: "assets/images/wear_mask.png",
                    title: "Wear face mask",
                    text:
                        "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrevenCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PrevenCard({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 156,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 136,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 2,
                    color: kShadowColor)
              ],
            ),
          ),
          Image.asset(image),
          Positioned(
            left: 130,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              height: 136,
              width: MediaQuery.of(context).size.width - 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: kTitleTextstyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset("assets/icons/forward.svg"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SymbtomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymbtomCard({
    Key? key,
    required this.image,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              isActive
                  ? BoxShadow(
                      offset: const Offset(0, 10),
                      color: kActiveShadowColor,
                      blurRadius: 20)
                  : BoxShadow(
                      offset: const Offset(0, 3),
                      color: kShadowColor,
                      blurRadius: 20)
            ]),
        child: Column(
          children: [
            Image.asset(
              "assets/images/headache.png",
              height: 90,
            ),
            const Text(
              "Headache",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
