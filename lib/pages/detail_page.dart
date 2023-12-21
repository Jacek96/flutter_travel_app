import 'package:flutter/material.dart';
import 'package:flutter_travel_app/widgets/app_buttons.dart';
import 'package:flutter_travel_app/widgets/app_large_text.dart';
import 'package:flutter_travel_app/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/view.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ApplargeText(
                            text: "Szwajcaria",
                            color: Colors.black87,
                          ),
                          ApplargeText(
                            text: "1600 zł",
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          AppText(
                            text: "Zermatt",
                            color: Colors.black87,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < gottenStars
                                      ? Colors.amber
                                      : Colors.grey,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: "(4.0)",
                            color: Colors.black87,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ApplargeText(
                        text: 'Liczba osób',
                        color: Colors.black87.withOpacity(0.8),
                        size: 25,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AppText(text: 'Wybierz ilość uczestników'),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(
                          5,
                          (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  size: 50,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : Color.fromARGB(255, 226, 210, 210),
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : Colors.white,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ApplargeText(
                        text: 'Opis',
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppText(
                          text:
                              'Szwajcaria to państwo kojarzące się przede wszystkim z ośnieżonymi stokami górskimi, szumiącymi wodospodami, a także licznymi jeziorami z unoszącą się nad taflą wody mgłą. Szwajcaria charakteryzuje się różnorodnością językową. Istnieją, aż cztery języki urzędowe. Jest to kraj bardzo drogi, a miasto Zurych jest czwartym z najdroższych na świecie. Mimo to kraj ten przyciąga odwiedzających, a turystyka stanowi jedną z najważniejszych gałęzi szwajcarskiej gospodarki.'),
                      SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              child: Row(
                children: [
                  AppButtons(
                    size: 60,
                    color: Colors.red,
                    backgroundColor: Colors.white,
                    borderColor: Colors.grey,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
