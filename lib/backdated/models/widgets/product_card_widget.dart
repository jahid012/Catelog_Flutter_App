import 'package:bcommerce/config.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final String pricePerUnit;
  final String unitQuantity;
  final String quantiry;
  final VoidCallback onTap;

  ProductCard({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.pricePerUnit,
    required this.unitQuantity,
    required this.quantiry,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 240,
      width: 160,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          onTap: onTap,
          child: Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.network(productImage),
              )),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                pricePerUnit,
                style: TextStyle(color: grey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            unitQuantity,
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Center(
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 20,
                            color: primaryColor,
                          ),
                        )
                      ],
                    ),
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove,
                          size: 20,
                          color: primaryColor,
                        ),
                        Text(
                          quantiry,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.add,
                          size: 20,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  )),
                ],
              )
            ],
          ),
        ))
      ]),
    );
  }
}
