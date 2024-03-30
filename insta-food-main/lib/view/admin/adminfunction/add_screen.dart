

import 'package:firstproject/controller/add_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addscreen extends StatelessWidget {
  const Addscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final provider = Provider.of<AddproductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text('Add Products'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Consumer<AddproductProvider>(builder: (context, pro, _) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: pro.image == null
                          ? TextButton(
                              onPressed: pro.getImageFromGallery,
                              child: const Text('Add Image'),
                            )
                          : Image.file(
                              pro.image!,
                            ),
                    );
                  }),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: provider.nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter the product name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: provider.priceController,
                    decoration: const InputDecoration(
                      hintText: 'Price',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Consumer<AddproductProvider>(builder: (context, prov, child) {
                    return DropdownButton(
                      value: prov.dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: prov.items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        prov.dropdownvalue = newValue!;
                        prov.dropdownfunc();
                      },
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          border: const Border(
                            bottom: BorderSide(style: BorderStyle.solid),
                          ),
                        ),
                        height: 1,
                      ),
                    );
                  }),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      provider.addbuttonpressed(context);
                      provider.clearaddproducts();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Product'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
