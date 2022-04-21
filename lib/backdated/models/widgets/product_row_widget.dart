import 'package:bcommerce/config.dart';
import 'package:flutter/material.dart';

class ProductRow extends StatelessWidget {
  bool isBool = false;
  ProductRow({Key? key, required this.isBool}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 100,
                child: Center(
                    child: Image.network(
                        "https://pngimg.com/uploads/cabbage/cabbage_PNG8804.png")),
              )),
              Expanded(
                  child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: isBool == false
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          "ProductName",
                          style: TextStyle(
                              color: textColor, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "50\$/50 Gram",
                          style: TextStyle(
                              color: textColor, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    isBool == false
                        ? Container(
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(children: [
                              Expanded(
                                child: Text(
                                  "50 Gram",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: textColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: primaryColor,
                                ),
                              )
                            ]))
                        : Text("50 Gram")
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                height: 100,
                padding: isBool == false
                    ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                    : EdgeInsets.only(left: 15, right: 15),
                child: Container(
                    child: isBool == false
                        ? Container(
                            height: 25,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: primaryColor,
                                  size: 20,
                                ),
                                Text(
                                  "ADD",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                          )
                        : Column(
                            children: [
                              const Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.black54,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 25,
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: primaryColor,
                                      size: 20,
                                    ),
                                    Text(
                                      "ADD",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                              )
                            ],
                          )),
              )),
            ],
          ),
          isBool == false ? Container() : Divider(color: Colors.black),
        ],
      ),
    );
  }
}
