import 'package:bcommerce/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bcommerce/config.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 110,
                color: primaryColor,
              ),
              Column(
                children: [
                  Container(
                    height: 558,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: ListView(
                      children: [
                        Container(
                          width: 250,
                          height: 100,
                          padding: EdgeInsets.only(left: 20, top: 45),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Asser Bugti",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: textColor),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("bcommerce@gmail.com"),
                                  ]),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    color: primaryColor,
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        listTile(icon: Icons.shop_outlined, title: "My Orders"),
                        listTile(
                            icon: Icons.location_on_outlined,
                            title: "My Delivery Address"),
                        listTile(
                            icon: Icons.percent_outlined,
                            title: "Refer A Friends"),
                        listTile(
                            icon: Icons.file_copy_outlined,
                            title: "Terms & Conditions"),
                        listTile(
                            icon: Icons.policy_outlined,
                            title: "Privacy & Policy"),
                        listTile(icon: Icons.add_chart, title: "My Orders"),
                        listTile(
                            icon: Icons.exit_to_app_outlined, title: "Log Out"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 36),
            child: CircleAvatar(
              radius: 53,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                backgroundColor: grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
