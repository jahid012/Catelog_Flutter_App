import 'dart:ui';

import 'package:bcommerce/config.dart';
import 'package:bcommerce/pages/search_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomeTwo extends StatefulWidget {
  HomeTwo({Key? key}) : super(key: key);

  @override
  State<HomeTwo> createState() => _HomeTwoState();
}

class _HomeTwoState extends State<HomeTwo> {
  List<String> _carouselimage = [];
  List _products = [];

  var _dotposition = 0;
  var _firebaseinstance = FirebaseFirestore.instance;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    getCarouselImage();
    getProducts();
    super.initState();
  }

  getCarouselImage() async {
    QuerySnapshot qr = await _firebaseinstance.collection("sliderimages").get();

    setState(() {
      for (var i = 0; i < qr.docs.length; i++) {
        _carouselimage.add(
          qr.docs[i]["imagepath"],
        );
      }
    });

    return qr.docs;
  }

  getProducts() async {
    QuerySnapshot qr = await _firebaseinstance.collection("products").get();

    setState(() {
      for (var i = 0; i < qr.docs.length; i++) {
        _products.add({
          "name": qr.docs[i]["name"],
          "image": qr.docs[i]["image"],
          "price": qr.docs[i]["price"],
          "description": qr.docs[i]["description"],
        });
      }
    });

    return qr.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 60,
                  child: TextFormField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: "Search Product Here",
                        hintStyle: TextStyle(fontSize: 15)),
                  ),
                )),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    color: primaryColor,
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AspectRatio(
            aspectRatio: 3.5,
            child: CarouselSlider(
                items: _carouselimage
                    .map((item) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(item),
                                  fit: BoxFit.fitWidth)),
                        ))
                    .toList(),
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (val, pageNavigator) {
                      setState(() {
                        _dotposition = val;
                      });
                    })),
          ),
          SizedBox(
            height: 10,
          ),
          DotsIndicator(
            dotsCount: _carouselimage.length == 0 ? 1 : _carouselimage.length,
            position: _dotposition.toDouble(),
            decorator: const DotsDecorator(
                activeColor: Colors.deepOrange,
                color: Colors.orangeAccent,
                spacing: EdgeInsets.all(8),
                activeSize: Size(8, 8),
                size: Size(6, 6)),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (_, index) {
                    return Card(
                      child: Column(
                        children: [
                          AspectRatio(
                            child: Image.network(_products[index]["image"]),
                            aspectRatio: 2,
                          ),
                          Text("${_products[index]["name"]}"),
                          Text("${_products[index]["price"].toString()}"),
                        ],
                      ),
                    );
                  }))
        ],
      )),
    );
  }
}
