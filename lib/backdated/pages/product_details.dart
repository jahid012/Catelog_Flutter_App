import 'package:flutter/material.dart';
import 'package:bcommerce/config.dart';

enum SinginCharactar { fill, outline }

class ProductDetails extends StatefulWidget {
  final String productName;
  final String productImage;
  ProductDetails(
      {Key? key, required this.productName, required this.productImage})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  SinginCharactar _charactar = SinginCharactar.fill;

  Widget bottomNavigationBar(
      {Color? iconColor,
      Color? backgroundColor,
      Color? color,
      String? title,
      IconData? iconData}) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(20),
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 17,
            color: iconColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title!,
            style: TextStyle(color: color),
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
            backgroundColor: textColor,
            color: bgColor,
            iconColor: bgColor,
            title: "Add To WishList",
            iconData: Icons.favorite_outline,
          ),
          bottomNavigationBar(
            backgroundColor: primaryColor,
            color: textColor,
            iconColor: textColor,
            title: "Shop Outlined",
            iconData: Icons.shop_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Product Details",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text("\$50"),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(10),
                    child: Image.network(widget.productImage),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Available Opions",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green,
                              ),
                              Radio(
                                activeColor: Colors.green,
                                onChanged: (value) {
                                  setState(() {
                                    _charactar = value as SinginCharactar;
                                  });
                                },
                                groupValue: _charactar,
                                value: SinginCharactar.fill,
                              )
                            ],
                          ),
                          Text("\$50"),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: grey,
                                ),
                                borderRadius: BorderRadius.circular(
                                  30,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 17,
                                  color: primaryColor,
                                ),
                                Text(
                                  "ADD",
                                  style: TextStyle(color: primaryColor),
                                )
                              ],
                            ),
                          )
                        ]),
                  )
                ]),
              )),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "About This Product",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ",
                    style: TextStyle(fontSize: 16, color: textColor),
                  ),
                ]),
          ))
        ],
      ),
    );
  }
}
