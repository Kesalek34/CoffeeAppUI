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

  final List<Map<String, dynamic>> coffeeList = [
    {
      'name': 'Espresso',
      'price': 6.50,
      'rating': 4.5,
      'reviews': 120,
      'image': 'lib/images/espresso.jpg',
      'description': 'A strong coffee served in small amounts with a layer of cream on top.',
    },
    {
      'name': 'Cappuccino',
      'price': 5.80,
      'rating': 4.8,
      'reviews': 89,
      'image': 'lib/images/cappuccino.jpg',
      'description': 'Coffee drink made with espresso and steamed milk foam.',
    },
    {
      'name': 'Latte',
      'price': 7.20,
      'rating': 4.6,
      'reviews': 156,
      'image': 'lib/images/latte.jpg',
      'description': 'Espresso coffee made with steamed milk and milk foam.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter coffee list by selected category
    List<Map<String, dynamic>> filteredCoffeeList = selectedCategory == 0
        ? coffeeList
        : coffeeList.where((coffee) =>
            coffee['name'].toString().toLowerCase() ==
            categories[selectedCategory].toLowerCase()).toList();

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
              child: GridView.builder(
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