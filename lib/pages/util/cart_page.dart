import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffeeappui/pages/util/payment_page.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  const CartPage({super.key, required this.cartItems});

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + (item['price'] as double));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart', style: GoogleFonts.poppins()),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      backgroundColor: const Color(0xFF1A1A1A),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty!',
                style: GoogleFonts.poppins(color: Colors.white70, fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.asset(item['image'], width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(item['name'], style: GoogleFonts.poppins(color: Colors.white)),
                        subtitle: Text('₦${item['price']}', style: GoogleFonts.poppins(color: Colors.white70)),
                        trailing: Icon(Icons.delete, color: Colors.white54),
                        // Add remove logic if needed
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total:', style: GoogleFonts.poppins(color: Colors.white, fontSize: 18)),
                          Text('₦${totalPrice.toStringAsFixed(2)}', style: GoogleFonts.poppins(color: Colors.white, fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PaymentPage(amount: totalPrice),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD4A574),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text('Proceed to Payment', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
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