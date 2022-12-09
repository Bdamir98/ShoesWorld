import 'package:flutter/material.dart';
import 'package:show_store/constants/color.dart';
import 'package:show_store/services/current_address_api.dart';
import 'package:show_store/widgets/customTextField.dart';

import 'tab_bar/tabbar.dart';

class HomePageUI extends StatelessWidget {
  const HomePageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  //Text('${data["name"]}'),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.teal,
                    child: Image.asset('assets/Ellipse 1.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Categories',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              MyTabBar(),
            ],
          ),
        ),
      ),
    );
  }
}
