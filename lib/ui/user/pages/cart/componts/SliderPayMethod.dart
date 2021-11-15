import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class SliderPayMethod extends StatelessWidget {
  const SliderPayMethod({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      child: CarouselSlider(
          items: images.map((e) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 180,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    e,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            aspectRatio: 2.0,
          )),
    );
  }
}