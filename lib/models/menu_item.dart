import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final String name;
  final String description;
  final List<dynamic> ingredients;
  final bool spicy;
  final bool vegetarian;
  final double price;
  final String image;

  const MenuItemCard({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.spicy,
    required this.vegetarian,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),

                // Description
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 10),

                // Ingredients
                Text(
                  "Ingredients: ${ingredients.join(", ")}",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                SizedBox(height: 10),

                // Spicy and Vegetarian Indicators
                Row(
                  children: [
                    // Spicy Indicator
                    if (spicy)
                      Row(
                        children: [
                          Icon(Icons.local_fire_department, color: Colors.red, size: 18),
                          SizedBox(width: 5),
                          Text(
                            "Spicy",
                            style: TextStyle(fontSize: 14, color: Colors.red),
                          ),
                        ],
                      ),

                    // Add space if both indicators exist
                    if (spicy && vegetarian) SizedBox(width: 15),

                    // Vegetarian Indicator
                    if (vegetarian)
                      Row(
                        children: [
                          Icon(Icons.eco, color: Colors.green, size: 18),
                          SizedBox(width: 5),
                          Text(
                            "Vegetarian",
                            style: TextStyle(fontSize: 14, color: Colors.green),
                          ),
                        ],
                      ),
                  ],
                ),
                SizedBox(height: 10),

                // Price
                Text(
                  "Price: \$${price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
