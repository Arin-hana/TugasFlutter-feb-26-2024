import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import './formlogin.dart';
import './theme.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            padding: const EdgeInsets.only(left: 14, bottom: 10, right: 14),
            child: SvgPicture.asset('materials/textures/logo.svg')),
        actions: <Widget>[
          IconButton(onPressed: () => null, icon: const Icon(Icons.translate)),
        ],
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          FlutterCarousel(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height - 160,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: false,
              enableInfiniteScroll: false,
              slideIndicator: CircularWaveSlideIndicator(
                  indicatorBackgroundColor: ColorMain.natural5,
                  currentIndicatorColor: ColorMain.natural2),
            ),
            items: carouselItems,
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                minimumSize: const Size(343, 53)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FormLogin()));
            },
            child: const Text('Get Started'),
          )
        ],
      )),
    );
  }
}

final List<Widget> carouselItems = [
  Center(
    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 100),
        child: Stack(
          children: <Widget>[
            Transform.rotate(
              angle: -12.83,
              child: Container(
                width: 344,
                height: 216,
                transform: Matrix4.translationValues(0, -60, 0),
                child: Image.asset('materials/textures/card02.png'),
              ),
            ),
            Transform.rotate(
              angle: -12.83,
              child: Container(
                width: 344,
                height: 216,
                transform: Matrix4.translationValues(-70, -160, 0),
                child: Image.asset('materials/textures/card01.png'),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: const Column(
          children: <Widget>[
            Text(
              'Easy to manage money',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: ColorMain.natural2),
            ),
            Padding(
                padding: EdgeInsets.only(top: 44),
                child: Text(
                  'Transfer and receive your money easily with dragonfly bank',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: ColorMain.natural4),
                ))
          ],
        ),
      )
    ]),
  ),
  Center(
    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 44),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 175,
                        height: 110,
                        child: Image.asset('materials/textures/card01.png'),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        transform: Matrix4.translationValues(0, 20, 0),
                        width: 66,
                        height: 66,
                        child: SvgPicture.asset('materials/textures/swirl.svg'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 44),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Transform.flip(
                        flipY: true,
                        flipX: true,
                        child: Container(
                          padding: const EdgeInsets.only(left: 20),
                          transform: Matrix4.translationValues(0, 20, 0),
                          width: 66,
                          height: 66,
                          child:
                              SvgPicture.asset('materials/textures/swirl.svg'),
                        ),
                      ),
                      SizedBox(
                        width: 175,
                        height: 110,
                        child: Image.asset('materials/textures/card02.png'),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Transfers between accounts',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: ColorMain.natural2),
              ),
            ),
            const Text(
              'Transferring balances is very easy between dragonfly bank accounts',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: ColorMain.natural4),
            )
          ],
        ),
      )
    ]),
  ),
  Center(
    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 50, top: 10),
              child: Image.asset('materials/textures/card03.png'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 44),
              child: Text(
                'Choose as needed',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: ColorMain.natural2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Choose the savings you want to open, we have lots of services according to what you need',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: ColorMain.natural4),
              ),
            ),
          ],
        ),
      )
    ]),
  ),
];
