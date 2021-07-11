import 'package:flutter/material.dart';
import 'package:my_proportion/widgets/calendar_timeline.dart';
import '../screens/menu_screen.dart';
import '../screens/diet_day_screen.dart';

// appBar: Calendar
// animation with menu

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController? animationController;
  final double maxSlide = 225;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    super.initState();
  }

  void toggleMenu() => animationController!.isDismissed
      ? animationController!.forward()
      : animationController!.reverse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 22),
          onPressed: () {
            toggleMenu();
          },
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
        title: Calendar(),
        toolbarHeight: 130,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: AnimatedBuilder(
          animation: animationController!,
          builder: (context, _) {
            double slide = maxSlide * animationController!.value;
            double scale = 1 - (animationController!.value * 0.3);
            return Stack(
              children: [
                MenuScreen(),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: DietDayScreen(),
                ),
              ],
            );
          }),
    );
  }
}
