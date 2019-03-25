import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

///动画分为两类 补间动画、基于物理的动画
class AnimationPage2 extends StatefulWidget {
  @override
  _AnimationPage2State createState() {
    return _AnimationPage2State();
  }
}

class _AnimationPage2State extends State<AnimationPage2>
    with TickerProviderStateMixin {
  AnimationController controller;
  //一个动画是需要实例化一个animation
  Animation sizeAnimation;
  Animation colorAnimation;
  CurvedAnimation curvedAnimation;
  @override
  initState() {
    super.initState();
    //动画控制器
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOutCirc, parent: controller);
    //大小的动画
    sizeAnimation = Tween(begin: 32.0, end: 100.0).animate(curvedAnimation);
    //颜色的动画
    colorAnimation = ColorTween(begin: Colors.red, end: Colors.red[100])
        .animate(curvedAnimation);
    controller.addListener(() {
      setState(() {});
    });
    controller.addStatusListener((AnimationStatus status) {
      print(status);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: IconButton(
        icon: Icon(Icons.favorite),
        iconSize: sizeAnimation.value,
        color: colorAnimation.value,
        onPressed: () {
          switch (controller.status) {
            case AnimationStatus.completed:
              /**翻转动画 */
              controller.reverse();
              break;
            default:
              /**启动动画 */
              controller.forward();
              break;
          }
        },
      ),
    ));
  }
}
