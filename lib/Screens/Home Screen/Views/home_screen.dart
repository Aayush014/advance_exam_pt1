import 'package:advance_exam_pt1/Provider/home_provider.dart';
import 'package:advance_exam_pt1/Screens/Details%20Screen/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        children: [
                          Text("Hello Welcome ,"),
                          Text("Aayush Patel"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey)),
                      child: DefaultTextStyle(
                        style: TextStyle(color: Colors.grey),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            Text("     Search items")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Icons.sort,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: provider.productModel.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3 / 4, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => DetailsScreen(),

                        ));
                          currentIndex = index;
                        },
                        child: DefaultTextStyle(
                          style: TextStyle(color: Colors.black),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        // color: Colors.black,
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              provider.productModel[index].image),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    provider.productModel[index].title,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(provider.productModel[index].category),
                                  Text("\$  "+provider.productModel[index].price.toString()),

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

int currentIndex = 0;
