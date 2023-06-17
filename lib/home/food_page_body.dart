import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:jonggack_food_delivery_app/home/main_food_page.dart';
import 'package:jonggack_food_delivery_app/utils/dimenstions.dart';
import 'package:jonggack_food_delivery_app/widgets/big_text.dart';
import 'package:jonggack_food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:jonggack_food_delivery_app/widgets/small_text.dart';

import '../utils/colors.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currPageValue = 0.0;

  // 배율
  double _scaleFactor = 0.8;
  double _height = Dimenstions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      _currPageValue = pageController.page!;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        Container(
          height: Dimenstions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildPageItem(index);
            },
          ),
        ),

        // dots
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.toInt(),
          decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        )

        // popular

        ,
        SizedBox(height: Dimenstions.width30),

        Container(
          margin: EdgeInsets.only(left: Dimenstions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(width: Dimenstions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: Dimenstions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallTest(
                  text: 'Food pariring',
                ),
              )
            ],
          ),
        ),

        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: Dimenstions.width20)
                  .copyWith(bottom: Dimenstions.height10),
              child: Row(
                children: [
                  Container(
                    width: Dimenstions.listViewImgSize,
                    height: Dimenstions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimenstions.radius20),
                      color: Colors.red,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/food0.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Dimenstions.listViewTextContainerSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimenstions.radius20),
                            bottomRight: Radius.circular(Dimenstions.radius20),
                          ),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimenstions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: 'Nutritious fruit meal in Japan'),
                            SizedBox(height: Dimenstions.height10),
                            SmallTest(text: 'With japanese charactristics'),
                            SizedBox(height: Dimenstions.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: 'Normal',
                                  iconColor: AppColors.iconColor1,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.location_on,
                                  text: '1.7km',
                                  iconColor: AppColors.mainColor,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.access_time_rounded,
                                  text: '32mins',
                                  iconColor: AppColors.iconColor2,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }

  // 1:54 까지 스케일 관련,

  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var curreTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, curreTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);

      var curreTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, curreTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var curreTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, curreTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: EdgeInsets.symmetric(horizontal: Dimenstions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimenstions.radius30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/food0.png"),
              ),
            ),
            child: Container(),
          ),
          //부모가 컨테이너 + 자식이 컨테이너 일 시 자식의 높이와 넓이는 무시된다.
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              // 아 이거를 어떻게 표현해야할지 .
              // 스택을 사용할 때 상하좌우 에 있는 것의 위치를 조정하고 싶을 땐 margin 의 수치를 이용하여 움직이낟, (뭔소린지 모르겟지)
              margin: EdgeInsets.only(
                  left: Dimenstions.width30,
                  right: Dimenstions.width30,
                  bottom: Dimenstions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimenstions.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimenstions.height15,
                    left: Dimenstions.height15,
                    right: Dimenstions.height15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Japanes Side'),
                    SizedBox(height: Dimenstions.height10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SmallTest(text: '4.5'),
                        const SizedBox(width: 10),
                        SmallTest(text: '1283'),
                        const SizedBox(width: 10),
                        SmallTest(text: 'comments'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: 'Normal',
                          iconColor: AppColors.iconColor1,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: '1.7km',
                          iconColor: AppColors.mainColor,
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: '32mins',
                          iconColor: AppColors.iconColor2,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
