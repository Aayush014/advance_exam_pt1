import 'package:advance_exam_pt1/Provider/home_provider.dart';
import 'package:advance_exam_pt1/Screens/Home%20Screen/Views/home_screen.dart';
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
                          fit: BoxFit.cover)),
                )
              ],
            ),
          ),
        ));
  }
}
