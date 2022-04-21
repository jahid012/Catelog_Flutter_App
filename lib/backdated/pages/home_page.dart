import 'package:bcommerce/config.dart';
import 'package:bcommerce/models/product_model.dart';
import 'package:bcommerce/pages/cart_page.dart';
import 'package:bcommerce/pages/product_details.dart';
import 'package:bcommerce/widgets/drawer_widget.dart';
import 'package:bcommerce/widgets/product_card_widget.dart';
import 'package:bcommerce/widgets/section_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildCategory(context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ProductCard(
            productName: "FreshBasil",
            productImage:
                "https://pngimg.com/uploads/cabbage/cabbage_PNG8804.png",
            pricePerUnit: "50\$/50Gram",
            unitQuantity: "50 Gm",
            quantiry: "1",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => ProductDetails(
                        productName: "FreshBasil",
                        productImage:
                            "https://pngimg.com/uploads/cabbage/cabbage_PNG8804.png",
                      ))));
            },
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          backgroundColor: primaryColor,
          title: Text(
            "Home",
            style: TextStyle(color: textColor),
          ),
          actions: [
            GestureDetector(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 235, 210, 136),
                child: Icon(
                  Icons.search,
                  size: 28,
                  color: textColor,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 9),
                child: CircleAvatar(
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 28,
                    color: textColor,
                  ),
                  radius: 20,
                  backgroundColor: Color.fromARGB(255, 235, 210, 136),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartPage()));
              },
            )
          ],
        ),
        drawer: const Drawer(child: SideDrawer()),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ListView(
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://c.neh.tw/thumb/f/720/6497605538283520.jpg")),
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(right: 155, bottom: 10),
                              child: Container(
                                height: 45,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(60),
                                        bottomLeft: Radius.circular(70))),
                                child: Center(
                                  child: Text(
                                    "Veg",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: text2Color,
                                        shadows: const [
                                          BoxShadow(
                                              color: Colors.green,
                                              blurRadius: 3,
                                              offset: Offset(3, 3))
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "30% Off",
                                    style: TextStyle(
                                        fontSize: 38,
                                        color: text2Color,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "On all Vegetables Product",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: text2Color,
                                    ),
                                  ),
                                ]),
                          ]),
                        )),
                    Expanded(
                      child: Container(),
                    )
                  ],
                ),
              ),
              buildTitles("Herbs Sessionings"),
              _buildCategory(context),
              buildTitles("Fresh Fruits"),
              _buildCategory(context),
            ],
          ),
        ));
  }
}
