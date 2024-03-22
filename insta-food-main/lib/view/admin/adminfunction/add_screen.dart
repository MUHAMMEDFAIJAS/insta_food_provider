import 'package:firstproject/controller/add_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addscreen extends StatelessWidget {
  const Addscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddproductProvider>(context);
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
                  provider.image == null
                      ? ElevatedButton(
                          onPressed: provider.getImageFromGallery,
                          child: const Text('Add Image'),
                        )
                      : Image.file(provider.image!),
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
                  DropdownButton(
                    value: provider.dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: provider.items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      provider.dropdownvalue = newValue!;
                    },
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          border: const Border(
                              bottom: BorderSide(style: BorderStyle.solid))),
                      height: 1,
                    ),
                  ),
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
