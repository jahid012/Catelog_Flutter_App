import 'package:flutter/material.dart';

Widget buildTitles(String? categoryTitle) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryTitle!,
          style: TextStyle(fontSize: 15),
        ),
        const Text(
          "View all",
          style: TextStyle(color: Colors.grey, fontSize: 15),
        )
      ],
    ),
  );
}
