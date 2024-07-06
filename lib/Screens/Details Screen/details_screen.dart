import 'package:advance_exam_pt1/Provider/home_provider.dart';
import 'package:advance_exam_pt1/Screens/Home%20Screen/Views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Consumer<HomeProvider>(
          builder: (context, provider, child) => Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    height: 380,
                    width: 280,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: NetworkImage(
                              provider.productModel[currentIndex].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Text(provider.productModel[currentIndex].title),
                  Text(provider.productModel[currentIndex].category),
                  Text(
                    provider.productModel[currentIndex].description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(provider.productModel[currentIndex].rating.rate
                          .toString())
                    ],
                  ),
                  Text("Current Vewers : " +
                      provider.productModel[currentIndex].rating.count
                          .toString()),
                  Spacer(),
                  DefaultTextStyle(
                    style: TextStyle(color: Colors.white),
                    child: Container(
                      height: 55,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.cart,color: Colors.white,),
                          Text("    Add to cart   |   \$  " + provider.productModel[currentIndex].price.toString())
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
