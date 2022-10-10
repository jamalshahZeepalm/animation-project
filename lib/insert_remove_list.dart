// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'model/data.dart';

class InsertAndRemoveScreen extends StatefulWidget {
  const InsertAndRemoveScreen({Key? key}) : super(key: key);

  @override
  State<InsertAndRemoveScreen> createState() => _InsertAndRemoveScreenState();
}

class _InsertAndRemoveScreenState extends State<InsertAndRemoveScreen> {
  var myKey = GlobalKey<AnimatedListState>();
  List<DemoData> items = List.from(myList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insertion and Deletion'),
        backgroundColor: Colors.purple.shade400,
      ),
      body: AnimatedList(
        key: myKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) {
          return CustomCard(
            demoData: items[index],
            animation: animation,
            onClick: (() => removeItems(index)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade400,
        onPressed: () => itemInsert(),
        child: const Icon(Icons.add),
      ),
    );
  }

  itemInsert() {
    final newIdex = items.isEmpty ? 0 : 1;
    final newListItem = (List.of(myList)..shuffle()).first;
    items.insert(newIdex, newListItem);
    myKey.currentState!
        .insertItem(newIdex, duration: const Duration(milliseconds: 650));
  }

  removeItems(int index) {
    final removeItem = items.removeAt(index);
    myKey.currentState!.removeItem(
        index,
        (context, animation) => CustomCard(
              demoData: removeItem,
              animation: animation,
              onClick: () {},
            ),
        duration: const Duration(milliseconds: 600));
  }
}

class CustomCard extends StatelessWidget {
  DemoData demoData;
  CustomCard({
    required this.demoData,
    required this.animation,
    required this.onClick,
    Key? key,
  }) : super(key: key);
  final Animation<double> animation;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      key: ValueKey(demoData.color),
      sizeFactor: animation,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(12),
        child: ListTile(
            leading: CircleAvatar(
              radius: 8,
              backgroundColor: demoData.color,
            ),
            title: Text(
              demoData.title,
              style: const TextStyle(fontSize: 16),
            ),
            subtitle: Text(demoData.subTitle),
            trailing: IconButton(
                onPressed: onClick,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))),
      ),
    );
  }
}
