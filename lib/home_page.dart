import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../grocery_item_tile.dart';
import '../cart_model.dart';
import 'cart_page.dart';
import 'profile.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int n = 0;
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
                SizedBox(width: 70.00),
                Text("Pharma@Home App", style: TextStyle(color: Colors.white)),
                SizedBox(width: 30.00),
                Icon(Icons.shopping_cart),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(children: [
            Row(children: [
              TextButton(
                child: Icon(Icons.arrow_back),
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
              Text("Hello",
                  style:
                      TextStyle(fontSize: 20.00, fontWeight: FontWeight.bold)),
            ]),
            SizedBox(height: 20.0),
            Center(
                child: Container(
                    width: 500,
                    height: 400,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text(
                              "Medicines",
                              style: GoogleFonts.notoSerif(
                                //fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          // recent orders -> show last 3
                          Expanded(
                            child: Consumer<CartModel>(
                              builder: (context, value, child) {
                                return GridView.builder(
                                  padding: const EdgeInsets.all(12),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: value.shopItems.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1 / 1.2,
                                  ),
                                  itemBuilder: (context, index) {
                                    return GroceryItemTile(
                                        itemName: value.shopItems[index][0],
                                        itemPrice: value.shopItems[index][1],
                                        imagePath: value.shopItems[index][2],
                                        color: value.shopItems[index][3],
                                        onPressed: () {
                                          Provider.of<CartModel>(context,
                                                  listen: false)
                                              .addItemToCart(index);
                                          setState(() {
                                            n = n + 1;
                                          });
                                        });
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )))
          ]),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xff8b4506),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CartPage();
                      },
                    ),
                  ),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Row(children: [
                  const Icon(Icons.shopping_bag),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CircleAvatar(
                      radius: 10.0,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Text(
                        n.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11.0,
                        ),
                      ),
                    ),
                  ),
                ]),
              ))))
    ]));
  }
}
