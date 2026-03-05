import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';


Widget scrollableCards() {
  return CarouselSlider(
    options: CarouselOptions(
      height: 190,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      enableInfiniteScroll: true,
    ),
    items: [
      flipkartBannerCard(
        "https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da",
        "STARTS ON 6TH MARCH",
        "STAY TUNED",
      ),
      flipkartBannerCard(
        "https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da",
        "PHONE(4a) LAUNCH 5TH Mar",
        "Built different",
      ),
      flipkartBannerCard(
        "https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da",
        "MEGA SALE LIVE",
        "Don't Miss Out",
      ),
    ],
  );
}

Widget flipkartBannerCard(String imageUrl,String title,String subTitle) {
  return Container(
    width:340,
    height: 150,
    margin:  EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: CustomColor.textSecondary.withOpacity(0.5),
          blurRadius: 8,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
             imageUrl,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomTextStyles.bodyLarge.copyWith(color: CustomColor.primarySurface)
                ),
                SizedBox(height: 4),
                Text(
                 subTitle,
                  style: CustomTextStyles.bodyMedium.copyWith(color: CustomColor.primarySurface)
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}