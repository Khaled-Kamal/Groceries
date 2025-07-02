import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/models/Fruits_model.dart';
import 'package:grocery_app/models/Cards.dart';
import 'package:svg_flutter/svg.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> item = [
    'assets/images/Slider 1.png',
    'assets/images/Slider 2.png',
    'assets/images/Slider 3.png',
  ];

  List<CategoryModel> Catgory = [
    CategoryModel(Image: 'assets/images/fruits.png', name: 'Fruits'),
    CategoryModel(Image: 'assets/images/milk and egg.png', name: 'Milk & egg'),
    CategoryModel(Image: 'assets/images/beverages.png', name: 'Beverages'),
    CategoryModel(Image: 'assets/images/laundary.png', name: 'Laundry'),
    CategoryModel(Image: 'assets/images/veg.png', name: 'Vegetables'),
  ];

  List<FruitsModel> Products = [
    FruitsModel(
      image: 'assets/images/banana.png',
      name: 'Banana',
      rate: '4.8',
      rateCount: '287',
      price: '3.99',
    ),
    FruitsModel(
      image: 'assets/images/Pepper.png',
      name: 'Pepper',
      rate: '4.8',
      rateCount: '287',
      price: '2.99',
    ),
    FruitsModel(
      image: 'assets/images/orangge.png',
      name: 'Orange',
      rate: '4.8',
      rateCount: '287',
      price: '2.99',
    ),
     FruitsModel(
      image: 'assets/images/milk and egg.png',
      name: 'Orange',
      rate: '4.8',
      rateCount: '287',
      price: '2.99',
    ),
  ];

  Set<int> selectedItems = {};

  void toggleItem(int index) {
    setState(() {
      if (selectedItems.contains(index)) {
        selectedItems.remove(index);
      } else {
        selectedItems.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset('assets/images/moto.svg'),
            Text(
              ' 61 Hopper street.. ',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff000000),
                ),
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, size: 25),
            Spacer(),
            SvgPicture.asset('assets/images/sala.svg'),
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: item.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(item[itemIndex]),
            options: CarouselOptions(
              height: 222,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 130,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => const SizedBox(width: 11),
              itemCount: Catgory.length,
              itemBuilder: (context, index) {
                final iteems = Catgory[index];
                return Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xffF6F6F6),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        iteems.Image,
                        height: 43,
                        width: 43,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      iteems.name,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xff5A5555),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' Fruits',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff0A0B0A),
                    ),
                  ),
                ),
                Text(
                  'See all',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xff0CA201),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18),
          SizedBox(
            height: 250,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => const SizedBox(width: 7),
              itemCount: Products.length,
              itemBuilder: (context, index) {
                final Show = Products[index];
                return Cards(
                  image: Show.image,
                  name: Show.name,
                  rate: Show.rate,
                  rateCount: Show.rateCount,
                  Price: Show.price,
                  ontap: () => toggleItem(index),
                );
              },
            ),
          ),
          SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 70,
              width: 405,
              decoration: BoxDecoration(
                color: Color(0xff0CA201),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedItems.length,
                        itemBuilder: (context, index) {
                          final itemIndex = selectedItems.elementAt(index);
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(5),
                              child: Image.asset(Products[itemIndex].image),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'View Basket(${selectedItems.length})',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  
                    
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