// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'dart:io';
import 'package:firstproject/controller/buy_now_provider.dart';
import 'package:firstproject/view/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class BuyNowPage extends StatelessWidget {
  const BuyNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('my orders');
    final buyprovider = Provider.of<Buynowprovider>(context, listen: false);
    buyprovider.getallbuyprovider();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text(
          'MY ORDERS',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const BottomNav()),
                (Route<dynamic> route) => false,
              );
            },
            icon: const Icon(
              Icons.home,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<Buynowprovider>(
              builder: (context, providers, child) {
                return ListView.builder(
                  itemCount: providers.buymodelList.length,
                  itemBuilder: (context, index) {
                    final data = providers.buymodelList[index];

                    return SizedBox(
                      width: 250,
                      height: 280,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 10,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image: FileImage(File(data.imagepath)),
                                      height: 90,
                                      width: 200,
                                    ),
                                  ),
                                  Text(
                                    data.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Gap(8),
                                  Text(
                                    data.price,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  const Text(
                                    'delivery with in : 2 hours',
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 20),
                                  ),
                                  const Gap(10),
                                  ElevatedButton(
                                    onPressed: () {
                                      providers.deleteallbuy(index);
                                      providers.getallbuyprovider();
                                    },
                                    child: const Text('cancel order'),
                                  )
                                ],
                              ),
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
            color: Colors.orange[200],
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Center(
                  child: Text(
                    'THANK YOU FOR SHOPPING',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
