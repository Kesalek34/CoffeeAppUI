import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeDetailsPage extends StatefulWidget {
  final Map<String, dynamic> coffee;

  const CoffeeDetailsPage({super.key, required this.coffee});

  @override
  State<CoffeeDetailsPage> createState() => _CoffeeDetailsPageState();
}

class _CoffeeDetailsPageState extends State<CoffeeDetailsPage> {
  int quantity = 1;
  String selectedSize = 'Medium';
  final List<String> sizes = ['Small', 'Medium', 'Large'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Column(
        children: [
          // Image section
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage(widget.coffee['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.arrow_back, color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.favorite_border, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Details section
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.coffee['name'],
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              ...List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  size: 16,
                                  color: index < widget.coffee['rating'].floor() 
                                    ? Colors.orange 
                                    : Colors.grey,
                                );
                              }),
                              const SizedBox(width: 8),
                              Text(
                                '${widget.coffee['rating']}',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.white60,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'R${widget.coffee['price'].toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFD4A574),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Description
                  Text(
                    'Description',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.coffee['description'],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white60,
                      height: 1.5,
                    ),
                  ),
                  
                  const SizedBox(height: 25),
                  
                  // Size selection
                  Text(
                    'Size',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: sizes.map((size) {
                      bool isSelected = selectedSize == size;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFFD4A574) : const Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            size,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  
                  const Spacer(),
                  
                  // Quantity and Add to cart
                  Row(
                    children: [
                      // Quantity selector
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.remove, color: Colors.white),
                            ),
                            Text(
                              '$quantity',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(width: 15),
                      
                      // Add to cart button
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Added to cart!'),
                                  backgroundColor: Color(0xFFD4A574),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD4A574),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Add to cart',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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