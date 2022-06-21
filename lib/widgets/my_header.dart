import 'package:flutter/material.dart';
import 'package:flutter_covid19_app/info_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';

class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  const MyHeader({
    Key? key,
    required this.image,
    required this.textTop,
    this.textBottom = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [Color(0xFF3383CD), Color(0xFF11349F)]),
            image:
                DecorationImage(image: AssetImage("assets/images/virus.png"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const InfoScreen();
                      },
                    ),
                  );
                },
                child: SvgPicture.asset("assets/icons/menu.svg"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Stack(
              children: [
                SvgPicture.asset(
                  image,
                  width: 200,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  child: Positioned(
                      top: 20,
                      left: 150,
                      child: Text(
                        "$textTop \n$textBottom",
                        style: kHeadingTextStyle.copyWith(color: Colors.white),
                      )),
                ),
                Container(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height - 50, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
