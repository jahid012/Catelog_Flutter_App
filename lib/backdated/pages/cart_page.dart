import 'package:bcommerce/config.dart';
import 'package:bcommerce/widgets/product_row_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text("\$ 170.00"),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text(
              "Submit",
              style: TextStyle(color: textColor),
            ),
            color: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              30,
            )),
            onPressed: () {},
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Cart",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          ProductRow(
            isBool: true,
          ),
          ProductRow(isBool: true),
          ProductRow(isBool: true),
          ProductRow(isBool: true),
        ],
      ),
    );
  }
}
