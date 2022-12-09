import 'package:flutter/material.dart';
import 'package:show_store/constants/color.dart';
import 'package:show_store/services/addidasapi.dart';
import 'package:show_store/ui/home_page/tab_bar/addidas/addidas_details.dart';

class AddidasPage extends StatelessWidget {
  const AddidasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetcAddidas(),
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
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.95),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final addidas = snapshot.data[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddidasShoesDetails(data: addidas),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffECEEF0),
                    ),
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
                                    '${addidas["price"]}',
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
                            tag: addidas,
                            child: Image.network(
                              '${addidas["image"]["src"]}',
                              height: 200,
                              width: 250,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '${addidas["displayName"]}',
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
