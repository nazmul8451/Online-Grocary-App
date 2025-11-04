import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> images = [
      "https://img.pikbest.com/origin/10/01/82/867pIkbEsTAIq.png!w700wp",
      "https://static.vecteezy.com/system/resources/previews/017/764/762/non_2x/banner-for-sale-people-rush-to-shop-with-bags-the-girl-runs-to-the-supermarket-young-people-with-bags-vector.jpg",
      "https://imgs.search.brave.com/PGnUSkDOh6l-ny6uXkAJ9FVsBafuDnlaVO1TNpzvPM8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS12ZWN0b3Iv/Z3JvY2VyeS1zdG9y/ZS1zYWxlLWJhbm5l/ci10ZW1wbGF0ZV8y/My0yMTUxMDg5ODQ2/LmpwZz9zZW10PWFp/c19oeWJyaWQmdz03/NDAmcT04MA",
      "https://imgs.search.brave.com/oC-W1M4a2i5NzxsolHnYGYb3AaIF15Np3xX0Y9LxBnM/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvNTAwcC8x/NC85OC9vbmxpbmUt/Z3JvY2VyeS1zdG9y/ZS1iYW5uZXItdGVt/cGxhdGUtZnJlc2gt/dmVjdG9yLTQ2NzAx/NDk4LmpwZw",
      "https://imgs.search.brave.com/EYXElk4H4JUn_Km4pWnKz_wZ9YNb-4y2wjywNiyjPpc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9sYW5k/aW5nLXBhZ2UtdGVt/cGxhdGUtd2ViLW1v/YmlsZS1iYW5uZXIt/dmVjdG9yLWdyb2Nl/cnktc3RvcmUtcG9z/dGVyLWJhc2tldC1m/b29kLXdoaXRlLWJh/Y2tncm91bmQtaWxs/dXN0cmF0aW9uLTM4/ODQ0MTUxMy5qcGc",
    ];

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              height: screenHeight * 0.1,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            aspectRatio: 16 / 4,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 1),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            initialPage: 0,
            viewportFraction: 0.9,
            autoPlayInterval: Duration(seconds: 3),
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
            },
          ),
        ),

      ],
    );
  }
}