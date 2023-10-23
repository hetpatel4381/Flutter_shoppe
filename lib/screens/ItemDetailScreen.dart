import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final Map<String, dynamic> product;
  ItemDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    final image = product["images"][0] as String?;
    final name = product["title"] as String?;
    final price = (product["price"] as num?)?.toDouble();
    final description = product["description"] as String?;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                image ?? '',
                height: 650,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 30,
                left: 20,
                child: Container(
                  width: 350,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                      const Text(
                        "Details",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 0,
                child: Container(
                  width: 355,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        name ?? 'Product Name',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${price ?? 0.0}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Container(
            width: 350,
            child: Text(description ?? 'Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey.shade700),)
            ),
            const SizedBox(height: 10,),
          Positioned(
            bottom: 0,
            child: Container(
              width: 350,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: const Center(
                  child: Text(
                "Buy Now",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            ),
            ),
        ],
      ),
    );
  }
}
