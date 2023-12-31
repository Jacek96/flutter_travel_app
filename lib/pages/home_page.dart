import 'package:flutter/material.dart';
import 'package:flutter_travel_app/widgets/app_large_text.dart';
import 'package:flutter_travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var imgs = {
    "food.png": "Food",
    "sport.jpg": "Sport",
    "museums.avif": "Museums",
    "events.jpg": "Events"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: ApplargeText(text: 'Miejsca do zwiedzenia'),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              indicator: CircleTabIndicator(color: Colors.amber, radius: 4),
              tabs: const [
                Tab(text: "Kraje"),
                Tab(text: "Atrakcje"),
                Tab(text: "Potrawy")
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                        image: const DecorationImage(
                          image: AssetImage("images/france.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                const Text('2'),
                const Text('3'),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ApplargeText(
                  text: 'Atrakcje',
                  size: 22,
                ),
                AppText(
                  text: 'Zobacz wszystkie',
                  color: Colors.grey,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            // margin: const EdgeInsets.only(right: 50),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage(
                                    "images/${imgs.keys.elementAt(index)}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            child: AppText(
                              text: imgs.values.elementAt(index),
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset =
        Offset(configuration.size!.width / 2, configuration.size!.height);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
