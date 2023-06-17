import 'package:flutter/material.dart';
import 'package:jonggack_food_delivery_app/home/food_page_body.dart';
import 'package:jonggack_food_delivery_app/utils/dimenstions.dart';
import 'package:jonggack_food_delivery_app/widgets/big_text.dart';
import 'package:jonggack_food_delivery_app/widgets/small_text.dart';

import '../utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: Dimenstions.height45,
              bottom: Dimenstions.height15,
            ),
            padding: EdgeInsets.only(
                left: Dimenstions.width20, right: Dimenstions.width20),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'ToKyo',
                        color: AppColors.mainColor,
                        size: 30,
                      ),
                      Row(
                        children: [
                          SmallTest(text: 'City'),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: Dimenstions.width45,
                        height: Dimenstions.height45,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenstions.radius15),
                          color: AppColors.mainColor,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimenstions.iconSize24,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          ))
        ],
      ),
    );
  }
}
