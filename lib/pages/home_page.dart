import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffeeappui/pages/util/coffee_card.dart';
import 'package:coffeeappui/pages/util/coffee_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = ['All', 'Espresso', 'Cappuccino', 'Latte', 'Americano'];
  int selectedCategory = 0;

  final List<Map<String, dynamic>> allCoffeeList = [
    {
      'name': 'Espresso',
      'price': 45.00,
      'rating': 4.5,
      'reviews': 120,
      'image': 'lib/images/espresso.jpg',
      'description': 'A strong coffee served in small amounts with a layer of cream on top.',
      'category': 'Espresso',
    },
    {
      'name': 'Double Espresso',
      'price': 55.00,
      'rating': 4.7,
      'reviews': 98,
      'image': 'lib/images/double_espresso.jpg',
      'description': 'Double shot of espresso for extra strength and flavor.',
      'category': 'Espresso',
    },
    {
      'name': 'Cappuccino',
      'price': 38.50,
      'rating': 4.8,
      'reviews': 89,
      'image': 'lib/images/cappuccino.jpg',
      'description': 'Coffee drink made with espresso and steamed milk foam.',
      'category': 'Cappuccino',
    },
    {
      'name': 'Dry Cappuccino',
      'price': 42.00,
      'rating': 4.6,
      'reviews': 67,
      'image': 'lib/images/dry_cappuccino.jpg',
      'description': 'Cappuccino with less steamed milk and more foam.',
      'category': 'Cappuccino',
    },
    {
      'name': 'Wet Cappuccino',
      'price': 40.00,
      'rating': 4.5,
      'reviews': 73,
      'image': 'lib/images/wet_cappuccino.jpg',
      'description': 'Cappuccino with more steamed milk and less foam.',
      'category': 'Cappuccino',
    },
    {
      'name': 'Latte',
      'price': 42.00,
      'rating': 4.6,
      'reviews': 156,
      'image': 'lib/images/latte.jpg',
      'description': 'Espresso coffee made with steamed milk and milk foam.',
      'category': 'Latte',
    },
    {
      'name': 'Vanilla Latte',
      'price': 48.00,
      'rating': 4.7,
      'reviews': 124,
      'image': 'lib/images/vanilla_latte.jpg',
      'description': 'Creamy latte with vanilla syrup for extra sweetness.',
      'category': 'Latte',
    },
    {
      'name': 'Caramel Latte',
      'price': 50.00,
      'rating': 4.8,
      'reviews': 189,
      'image': 'lib/images/caramel_latte.jpg',
      'description': 'Rich latte with caramel syrup and foam art.',
      'category': 'Latte',
    },
    {
      'name': 'Americano',
      'price': 35.00,
      'rating': 4.3,
      'reviews': 87,
      'image': 'lib/images/americano.jpg',
      'description': 'Espresso shots diluted with hot water for a lighter taste.',
      'category': 'Americano',
    },
    {
      'name': 'Iced Americano',
      'price': 38.00,
      'rating': 4.4,
      'reviews': 95,
      'image': 'lib/images/iced_americano.jpg',
      'description': 'Refreshing cold americano with ice cubes.',
      'category': 'Americano',
    },
  ];

  List<Map<String, dynamic>> get filteredCoffeeList {
    if (selectedCategory == 0) {
      // "All" category - show all coffees
      return allCoffeeList;
    } else {
      // Filter by selected category
      String selectedCategoryName = categories[selectedCategory];
      return allCoffeeList.where((coffee) => 
        coffee['category'] == selectedCategoryName
      ).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.menu, color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.notifications_outlined, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Greeting
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Grab your favorite coffee before it gets cold',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search favorite coffee',
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.white70),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Categories
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedCategory == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFD4A574) : Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: isSelected ? const Color(0xFFD4A574) : Colors.white30,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.white60,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // Coffee Grid
            Expanded(
              child: filteredCoffeeList.isEmpty 
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.coffee_outlined,
                          size: 64,
                          color: Colors.white30,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No coffees available\nin this category',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: filteredCoffeeList.length,
                    itemBuilder: (context, index) {
                      final coffee = filteredCoffeeList[index];
                      return CoffeeCard(
                        coffee: coffee,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CoffeeDetailsPage(coffee: coffee),
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
    );
  }
}