import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartScreen(),
    );
  }
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> selectedItems = []; // لتخزين المنتجات المختارة

  void addItem(String item) {
    setState(() {
      if (!selectedItems.contains(item)) {
        selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          // السطر الأخضر (مثال)
          Container(
            color: Colors.green,
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Banana', style: GoogleFonts.inter(color: Colors.white)),
                Row(
                  children: [
                    Icon(Icons.shopping_basket, color: Colors.white),
                    Text('View Basket', style: GoogleFonts.inter(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
          // عرض المنتجات المختارة
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: selectedItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Chip(
                    label: Text(selectedItems[index]),
                    avatar: Icon(Icons.local_grocery_store),
                  ),
                );
              },
            ),
          ),
          // أزرار المنتجات (مثال)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => addItem('Banana'),
                child: Text('Add Banana'),
              ),
              ElevatedButton(
                onPressed: () => addItem('Pepper'),
                child: Text('Add Pepper'),
              ),
              ElevatedButton(
                onPressed: () => addItem('Orange'),
                child: Text('Add Orange'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}