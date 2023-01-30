
import 'package:flutter/material.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/ratings_titles_widget.dart';

import '../../../../Resources/color_manager.dart';

class ReviewsStats extends StatelessWidget {
  const ReviewsStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 9,
        child: Container(
          height: 130,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 15.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RatingTitles(
                      title: 'Execelent',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        flex: 5,
                        child: ProgresWidget(
                          selectedColor:
                              ColorManager.darkGreen,
                          currentStep: 54,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    TotalRatings(
                      ratings: '1,399',
                    ),
                  ],
                ),
                Row(
                  children: [
                    RatingTitles(
                      title: 'Very Good',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        flex: 5,
                        child: ProgresWidget(
                          selectedColor:
                              ColorManager.midGreen,
                          currentStep: 40,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    TotalRatings(
                      ratings: '399',
                    ),
                  ],
                ),
                Row(
                  children: [
                    RatingTitles(
                      title: 'Good',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        flex: 5,
                        child: ProgresWidget(
                          selectedColor:
                              ColorManager.lightGreen,
                          currentStep: 35,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    TotalRatings(
                      ratings: '319',
                    ),
                  ],
                ),
                Row(
                  children: [
                    RatingTitles(
                      title: 'Average',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        flex: 5,
                        child: ProgresWidget(
                          selectedColor:
                              ColorManager.appBtn,
                          currentStep: 30,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    TotalRatings(
                      ratings: '219',
                    ),
                  ],
                ),
                Row(
                  children: [
                    RatingTitles(
                      title: 'Poor',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        flex: 5,
                        child: ProgresWidget(
                          selectedColor: ColorManager.red,
                          currentStep: 18,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    TotalRatings(
                      ratings: '342',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
