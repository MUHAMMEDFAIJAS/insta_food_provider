import 'dart:io';
import 'package:firstproject/controller/buy_now_provider.dart';
import 'package:firstproject/controller/cart_provider.dart';
import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:firstproject/view/buy_now.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCart extends StatelessWidget {
  const AddCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<CartProvider>(context, listen: false);

    cartprovider.getallcartsprovider();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'CART',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        backgroundColor: Colors.orange[300],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer2<CartProvider, Buynowprovider>(
              builder: (context, providers, buypro, child) {
                return ListView.builder(
                  itemCount: providers.cartmodelList.length,
                  itemBuilder: (context, index) {
                    final data = providers.cartmodelList[index];

                    return Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      height: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 10,
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
                                const SizedBox(height: 25),
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
                                ElevatedButton(
                                  onPressed: () {
                                    buypro.addbuynowprovider(BuynowModel(
                                      name: data.name,
                                      price: data.price,
                                      imagepath: data.imagepath,
                                    ));
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BuyNowPage()));
                                  },
                                  child: const Text('Buy Now'),
                                ),
                                ElevatedButton.icon(
                                    onPressed: () {
                                      cartprovider.deletecartprovider(index);

                                      cartprovider.getallcartsprovider();
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    ),
                                    label: const Text('Delete'))
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
                    Consumer<CartProvider>(builder: (context, pro, _) {
                      return Text(
                        '₹ ${pro.totalcartprice()}',
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
