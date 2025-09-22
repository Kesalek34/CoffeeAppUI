import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;

  const CoffeeTile({
    super.key,
    required this.coffeeImagePath,
    required this.coffeeName,
    required this.coffeePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        width: 200,
        height: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF2A2A2A),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image takes half of the height
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  coffeeImagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            // Text section fits in remaining space
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffeeName,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'With Almond Milk',
                          style: GoogleFonts.poppins(
                            color: Colors.white60,
                            fontSize: 13,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'R$coffeePrice',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD4A574),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 18,
                            color: Colors.white,
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
      ),
    );
  }
}