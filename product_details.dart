import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productName;
  final String imagePath;
  final double rating;
  final double originalPrice;
  final double discountedPrice;
  final bool inStock;

  const ProductDetailsScreen({
    super.key,
    required this.productName,
    required this.imagePath,
    required this.rating,
    required this.originalPrice,
    required this.discountedPrice,
    required this.inStock,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      imagePath,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange),
                      Text(" $rating (134)"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    productName,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Status: ${inStock ? "In Stock" : "Out of Stock"}",
                    style: const TextStyle(color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade700,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "25% OFF",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "\$$originalPrice",
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "\$$discountedPrice",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.black),
                      onPressed: () {},
                    ),
                    const Text("1", style: TextStyle(fontSize: 18)),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                  ),
                  child: const Text("Add to Cart",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
