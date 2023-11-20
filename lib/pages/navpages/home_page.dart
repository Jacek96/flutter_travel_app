import 'package:flutter/material.dart';
import 'package:flutter_travel_app/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
                Icon(
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
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: ApplargeText(text: 'Miejsca do zwiedzenia'),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              indicator: CircleTabIndicator(color: Colors.amber, radius: 4),
              tabs: [
                Tab(text: "Kraje"),
                Tab(text: "Atrakcje"),
                Tab(text: "Potrawy")
              ],
            ),
          ),
          Container(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                Text('1'),
                Text('2'),
                Text('3'),
              ],
            ),
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
