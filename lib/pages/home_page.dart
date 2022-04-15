import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning/models/catelog.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catelog = await rootBundle.loadString("assets/files/catelog.json");
    final decodedData = jsonDecode(catelog);
    var products = decodedData["products"];
    CatelogModel.items =
        List.from(products).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Learning'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15),
                  itemBuilder: (context, index) {
                    final item = CatelogModel.items[index];
                    return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: GridTile(
                          header: Container(
                            child: Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(color: Colors.deepOrange),
                            padding: const EdgeInsets.all(10.0),
                          ),
                          child: Image.network(item.image),
                          footer: Container(
                            child: Text(
                              item.price.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            decoration:
                                const BoxDecoration(color: Colors.amber),
                            padding: const EdgeInsets.all(10.0),
                          ),
                        ));
                  },
                  itemCount: CatelogModel.items.length,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
