import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/home/model/list_of_models.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatelessWidget {
  final List<Banners> banners;

  const HomeCarousel({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: banners.length,
      itemBuilder: (context, index, realIndex) {
        final banner = banners[index];

        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            banner.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      },
      options: CarouselOptions(autoPlay: true, viewportFraction: 1),
    );
  }
}
