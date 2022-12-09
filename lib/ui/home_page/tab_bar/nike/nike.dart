import 'package:flutter/material.dart';
import 'package:show_store/constants/color.dart';
import 'package:show_store/services/nikeapi.dart';
import 'package:show_store/ui/home_page/tab_bar/nike/nike_details.dart';

class NikePage extends StatelessWidget {
  const NikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchNike(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.95),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final nike = snapshot.data[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NikeShoesDetails(data: nike),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffF6F6F6)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    r'$',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: buttonColor),
                                  ),
                                  Text(
                                    '${nike["price"]["currentPrice"]}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Icon(Icons.favorite_outline)
                            ],
                          ),
                          Hero(
                            tag: nike,
                            child: Image.network(
                              '${nike["images"]["portraitURL"]}',
                              height: 200,
                              width: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '${nike["title"]}',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
