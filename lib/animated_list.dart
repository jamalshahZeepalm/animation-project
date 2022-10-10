// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:slidetransition/model/data.dart';

class AnimatedListDemo extends StatefulWidget {
  const AnimatedListDemo({Key? key}) : super(key: key);

  @override
  State<AnimatedListDemo> createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listkey = GlobalKey<AnimatedListState>();
  List<Widget> newList = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addData();
    });
  }

  void addData() {
   
    Future ft = Future(() {});
    myList.forEach((DemoData data) {
      ft = ft.then((value) {
        return Future.delayed(const Duration(milliseconds: 150), () {
          newList.add(_buildTitle(data));
          _listkey.currentState!.insertItem(newList.length - 1);
        });
      });
    });
  }

  Tween<Offset> _offset = Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade400,
          title: const Text(
            'Animated List',
            style: TextStyle(fontSize: 16),
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        body: AnimatedList(
          key: _listkey,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index, Animation<double> Animation) {
            return SlideTransition(
              position: Animation.drive(_offset),
              child: newList[index],
            );
          },
          initialItemCount: newList.length,
        ),
      ),
    );
  }
}

Widget _buildTitle(DemoData demodata) {
  return ListTile(
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 8,
        backgroundColor: demodata.color,
      ),
    ),
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        demodata.title,
        style: const TextStyle(fontSize: 16),
      ),
    ),
    subtitle: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(demodata.subTitle),
    ),
    trailing: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Text(
        demodata.status.toString(),
        textAlign: TextAlign.justify,
      ),
    ),
  );
}
