import 'package:flutter/material.dart';
import 'package:flutter_shoppe/screens/ItemDetailScreen.dart';
import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart' as http;
import 'dart:convert';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Map<String, dynamic>> products = [];
  int currentPage = 1;
  int itemsPerPage = 20;

  final ScrollController _scrollerController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchProducts(currentPage);
    _scrollerController.addListener(_scrollListener);
  }

  Future<void> fetchProducts(int page) async {
    final response = await http.get(Uri.parse(
        // "https://api.escuelajs.co/api/v1/products?page=$page&limit=$itemsPerPage"));
        "https://api.escuelajs.co/api/v1/products?page=$page&limit=$itemsPerPage"));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        if (page == 1) {
          products = List<Map<String, dynamic>>.from(responseData);
        } else {
          products.addAll(List<Map<String, dynamic>>.from(responseData));
        }
      });
    } else {
      throw Exception("Failed to Load Data");
    }
  }

  void _scrollListener() {
    if (_scrollerController.position.pixels ==
        _scrollerController.position.maxScrollExtent) {
      currentPage++;
      fetchProducts(currentPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 100,
          ),
          child: GridView.builder(
              shrinkWrap: true,
              controller: _scrollerController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final image = product["images"][0] as String?;
                final name = product["title"] as String?;
                final price = (product["price"] as num?)?.toDouble();

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ItemDetails(product: product);
                      }),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              image ?? '',
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    name ?? '',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('\$${price ?? 0.0}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                ),
                                child: const Text(
                                  "Add to Cart",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
