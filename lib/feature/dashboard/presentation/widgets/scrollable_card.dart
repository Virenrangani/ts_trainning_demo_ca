import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';

class ScrollableCard extends StatelessWidget {
  const ScrollableCard({super.key});

  @override
  Widget build(BuildContext context) {
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
        FlipKartBannerCard(
          imageUrl: "https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da",
          title: "STARTS ON 6TH MARCH",
          subTitle: "STAY TUNED",
        ),
        FlipKartBannerCard(
          imageUrl: "https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da",
          title: "PHONE(4a) LAUNCH 5TH Mar",
          subTitle: "Built different",
        ),
        FlipKartBannerCard(
          imageUrl: "https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da",
          title: "MEGA SALE LIVE",
          subTitle: "Don't Miss Out",
        ),
      ],
    );
  }
}


class FlipKartBannerCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  const FlipKartBannerCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.sizeOf(context).width*0.8,
      height: 150,
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
              left: 12,
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
}