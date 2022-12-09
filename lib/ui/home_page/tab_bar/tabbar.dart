import 'package:flutter/material.dart';
import 'package:show_store/constants/color.dart';
import 'package:show_store/ui/home_page/tab_bar/addidas/addidas.dart';
import 'package:show_store/ui/home_page/tab_bar/nike/nike.dart';

import 'puma/puma.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(
              labelColor: Colors.black,
              indicatorColor: buttonColor,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  text: 'Nike',
                ),
                Tab(
                  text: 'Addidas',
                ),
                Tab(
                  text: 'Reebok',
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TabBarView(
                  children: [
                    NikePage(),
                    AddidasPage(),
                    PumaPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
