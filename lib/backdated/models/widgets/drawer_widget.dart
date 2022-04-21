import 'package:bcommerce/config.dart';
import 'package:bcommerce/pages/profile_page.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  Widget listTile({IconData? icon, String? title, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
        color: text2Color,
      ),
      title: Text(
        title!,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: ListView(children: [
        DrawerHeader(
            child: Row(
          children: [
            CircleAvatar(
              backgroundColor: grey,
              radius: 40,
              child: CircleAvatar(
                backgroundColor: primaryColor,
                radius: 37,
              ),
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome Guest"),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 30,
                  child: OutlinedButton(
                    child: Text(
                      "LogIn",
                      style: TextStyle(color: text2Color),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        )),
        listTile(icon: Icons.home_outlined, title: "Home"),
        listTile(icon: Icons.shop_outlined, title: "Review Cart"),
        listTile(
            icon: Icons.person_outline,
            title: "My Profile",
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyProfile()));
            }),
        listTile(icon: Icons.notifications_outlined, title: "Notification"),
        listTile(icon: Icons.star_border, title: "Rating & Review"),
        listTile(icon: Icons.favorite_outline, title: "WishLish"),
        listTile(icon: Icons.copy_outlined, title: "Raise & Complaint"),
        listTile(icon: Icons.format_quote_outlined, title: "FAQs"),
        Container(
          height: 120,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("contact & Support"),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [Text("Call us:"), Text("+88012345679")],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [Text("Mail us:"), Text("bcommerce@gmail.com")],
              ),
            )
          ]),
        )
      ]),
    );
  }
}
