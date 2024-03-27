import 'dart:developer';
import 'dart:io';

import 'package:firstproject/controller/food_model_provider.dart';
import 'package:firstproject/view/admin/adminfunction/update_product.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Viewproducts extends StatelessWidget {
  const Viewproducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('view products');
    final provider = Provider.of<FoodProvider>(context, listen: false);
    // final totalprovider = Provider.of<FoodProvider>(context);
    provider.getallproductsprovider();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text(
          'ALL PRODUCTS',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FoodProvider>(
              builder: (context, providers, child) {
                return ListView.builder(
                  itemCount: providers.foodmodel.length,
                  itemBuilder: (context, index) {
                    final data = providers.foodmodel[index];
                    return Container(
                      width: 120,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image(
                                image: FileImage(File(data.imagepath)),
                                width: 200,
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  data.name,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Price: ${data.price}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                ElevatedButton.icon(
                                    onPressed: () {
                                      provider.deleteproductsprovider(index);
                                      provider.getallproductsprovider();
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    ),
                                    label: const Text('Delete')),
                                IconButton(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditScreen(
                                          name: data.name,
                                          price: data.price,
                                          imagepath: data.imagepath,
                                          index: index,
                                          catogery: data.catagory,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.orange[300],
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'TOTAL AMOUNT',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Consumer<FoodProvider>(builder: (context, pro, _) {
                      return Text(
                        '₹ ${pro.totalprice1()}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
