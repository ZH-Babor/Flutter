import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Entry point of the Flutter application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: HomeScreen(), // Sets the HomeScreen as the main screen
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'), // Title in the app bar
        actions: const [
          Icon(Icons.account_circle)
        ], // Profile icon on the right
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adds padding to the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Category',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold)), // Category title
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  4, (index) => CategoryBox()), // Displays 4 category boxes
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Products',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold)), // Popular products title
                Text('View all',
                    style: TextStyle(color: Colors.blue)), // View all button
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Displays products in 2 columns
                  crossAxisSpacing: 10, // Horizontal spacing
                  mainAxisSpacing: 10, // Vertical spacing
                  childAspectRatio: 0.7, // Aspect ratio of the product cards
                ),
                itemCount: 4, // Total number of products to display
                itemBuilder: (context, index) {
                  return ProductCard(); // Returns a product card widget
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'), // Home tab
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Order'), // Order tab
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification'), // Notification tab
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
      width: 70, // Width of the category box
      height: 70, // Height of the category box
      decoration: BoxDecoration(
        color: Colors.grey[300], // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10), // Padding inside the card
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              spreadRadius: 2), // Shadow effect
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/shoes.png'), // Placeholder for product image
                  fit: BoxFit.cover, // Adjusts the image to cover the container
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text('Green Nike Air Shoes',
              style: TextStyle(fontWeight: FontWeight.bold)), // Product name
          const Text('3.9 ⭐', style: TextStyle(color: Colors.orange)), // Rating
          const Text('\$2500.0',
              style: TextStyle(fontWeight: FontWeight.bold)), // Price
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              mini: true, // Small-sized button
              backgroundColor: Colors.black, // Button color
              onPressed: () {},
              child: const Icon(Icons.add, color: Colors.white), // Plus icon
            ),
          ),
        ],
      ),
    );
  }
}
