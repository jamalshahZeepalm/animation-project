// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slidetransition/model/data.dart';

class SlideTransitions extends StatefulWidget {
  const SlideTransitions({Key? key}) : super(key: key);

  @override
  State<SlideTransitions> createState() => _SlideTransitionsState();
}

class _SlideTransitionsState extends State<SlideTransitions>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    100.milliseconds.delay().then(
          (value) => _controller.forward(),
        );

    30.seconds.delay().then(
          (value) => controller.forward(),
        );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade400,
          title: ScaleTransition(
              scale: controller,
              child: const Text(
                'Slide Transition and Fade Animation',
                style: TextStyle(fontSize: 16),
              )),
        ),
        backgroundColor: Colors.grey.shade200,
        body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return CustomCard(
              demoData: myList[index],
              animationController: _controller,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: myList.length,
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  AnimationController animationController;
  DemoData demoData;
  CustomCard({
    required this.demoData,
    required this.animationController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScaleTransition(
        // position: Tween(
        //   begin: const Offset(0.1, 1),
        //   end: Offset.zero,
        // ).animate(animationController),
        scale: animationController,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(12),
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 8,
                backgroundColor: demoData.color,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FadeTransition(
                  opacity: animationController,
                  child: Text(
                    demoData.title,
                    style: const TextStyle(fontSize: 16),
                  )),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(demoData.subTitle),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                demoData.status.toString(),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
