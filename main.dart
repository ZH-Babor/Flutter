import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [Icon(Icons.account_circle)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) => const CategoryBox()),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Products',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('View all', style: TextStyle(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ProductCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductDetailsScreen(
                            productName: 'Green Nike Air Shoes',
                            imageUrl: 'assets/images/shoes.png',
                            originalPrice: 100.0,
                            discountedPrice: 85.0,
                            rating: 4.3,
                            reviewsCount: 134,
                            inStock: true,
                            description:
                                'There are many variations of passages of Lorem Ipsum available...',
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
        ],
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final VoidCallback onTap;

  const ProductCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Navigate to ProductDetailsScreen when tapped
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 2)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/shoes.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text('Green Nike Air Shoes',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('3.9 ⭐', style: TextStyle(color: Colors.orange)),
            const Text('\$2500.0',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Colors.black,
                onPressed: () {},
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final String productName;
  final String imageUrl;
  final double originalPrice;
  final double discountedPrice;
  final double rating;
  final int reviewsCount;
  final bool inStock;
  final String description;

  const ProductDetailsScreen({
    super.key,
    required this.productName,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountedPrice,
    required this.rating,
    required this.reviewsCount,
    required this.inStock,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(imageUrl, height: 250, fit: BoxFit.cover),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      Text(' $rating ($reviewsCount)',
                          style: const TextStyle(fontSize: 16)),
                      const Spacer(),
                      const Icon(Icons.share, color: Colors.black),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(productName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Status: ${inStock ? "In Stock" : "Out of Stock"}',
                      style: TextStyle(
                          fontSize: 16,
                          color: inStock ? Colors.green : Colors.red)),
                  const SizedBox(height: 10),
                  const Text('Description',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54)),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 12)),
                    onPressed: () {},
                    child: const Text('Add to Cart',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
