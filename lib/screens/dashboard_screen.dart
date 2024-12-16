import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/menu_item.dart';
import 'menu_items_screen.dart';

class FoodMenuScreen extends StatefulWidget {
  @override
  _FoodMenuScreenState createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  late Map<String, List<dynamic>> menuData;
  String selectedCategory = "pizza";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMenuData();
  }

  Future<void> loadMenuData() async {
    final String response =
    await rootBundle.loadString('assets/menu_data.json');
    final data = json.decode(response);

    setState(() {
      menuData = {
        "pizza": data['pizza'],
        "dessert": data['dessert'],
      };
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.pinkAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Delicious Menu 🍕",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Category Selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryButton(
                      title: "Pizzas",
                      icon: Icons.local_pizza,
                      isSelected: selectedCategory == "pizza",
                      onTap: () {
                        setState(() {
                          selectedCategory = "pizza";
                        });
                      },
                    ),
                    CategoryButton(
                      title: "Desserts",
                      icon: Icons.cake,
                      isSelected: selectedCategory == "dessert",
                      onTap: () {
                        setState(() {
                          selectedCategory = "dessert";
                        });
                      },
                    ),
                  ],
                ),
              ),

              // Menu Items
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: menuData[selectedCategory]?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = menuData[selectedCategory]![index];
                    return MenuItemCard(
                      name: item['name'],
                      description: item['description'],
                      ingredients: item['ingredients'],
                      spicy: item['spicy'],
                      vegetarian: item['vegetarian'],
                      price: item['price'],
                      image: item['image'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
