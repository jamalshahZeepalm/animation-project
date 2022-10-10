import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slidetransition/animated_list.dart';
import 'package:slidetransition/insert_remove_list.dart';
import 'package:slidetransition/sildetransition.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        title: const Text(
          'Animation',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade400,
                ),
                onPressed: () {
                  Get.to(() => const SlideTransitions());
                },
                child: const Text('Slide Transition')),
          ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade400,
                ),
                onPressed: () {
                  Get.to(() => const AnimatedListDemo());
                },
                child: const Text('Animated List')),
          ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade400,
                ),
                onPressed: () {
                  Get.to(() => const InsertAndRemoveScreen());
                },
                child: const Text('Animated List Insert and Remove')),
          )
        ],
      ),
    );
  }
}
