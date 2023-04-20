import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'proceed.dart';

import '../cart_model.dart';

import 'profile.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/3683041/pexels-photo-3683041.jpeg?auto=compress&cs=tinysrgb&w=600'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff8b4506),
            title: Row(
              children: [
                Text("Pharma@Home App", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(children: [
            Row(children: [
              TextButton(
                child: Icon(Icons.arrow_back),
                //child: Text(
                //  "Home",
                // style: TextStyle(
                //   fontSize: 16,
                //  ),
                //  ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ProfileApp();
                    }),
                  );
                  print("hello");
                },
              ),
              Text("Hello!",
                  style:
                      TextStyle(fontSize: 20.00, fontWeight: FontWeight.bold)),
            ]),
            SizedBox(height: 20.0),
            Center(
                child: Container(
                    width: 500,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.7),
                          spreadRadius: 2,
                          blurRadius: 16,
                          offset: Offset(0, 2),
                        ),
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 16,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Consumer<CartModel>(
                        builder: (context, value, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Let's order fresh items for you
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                child: Text(
                                  "My Cart",
                                  style: GoogleFonts.notoSerif(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              // list view of cart
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ListView.builder(
                                    itemCount: value.cartItems.length,
                                    padding: EdgeInsets.all(12),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: ListTile(
                                            leading: Image.network(
                                              value.cartItems[index][2],
                                              height: 36,
                                            ),
                                            title: Text(
                                              value.cartItems[index][0],
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                            subtitle: Text(
                                              '\$' + value.cartItems[index][1],
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                            trailing: IconButton(
                                              icon: const Icon(Icons.cancel),
                                              onPressed: () => Provider.of<
                                                          CartModel>(context,
                                                      listen: false)
                                                  .removeItemFromCart(index),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              // total amount + pay now

                              Padding(
                                padding: const EdgeInsets.all(36.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.green,
                                  ),
                                  padding: const EdgeInsets.all(24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Total Price',
                                            style: TextStyle(
                                                color: Colors.green[200]),
                                          ),

                                          const SizedBox(height: 8),
                                          // total price
                                          Text(
                                            '\$${value.calculateTotal()}',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),

                                      // pay now
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.green.shade200),
                                          borderRadius:
                                              BorderRadius.circular(28),
                                        ),
                                        padding: const EdgeInsets.all(12),
                                        child: Row(
                                          children: [
                                            TextButton(
                                              child: Text(
                                                'Proceed',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                    return ProceedApp();
                                                  }),
                                                );
                                                print("hello");
                                              },
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )))
          ]))
    ]));
  }
}
