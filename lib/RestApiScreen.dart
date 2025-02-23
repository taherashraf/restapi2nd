import 'package:flutter/material.dart';
import 'package:restapi2nd/ProductController.dart';

class RestApiScreen extends StatefulWidget {
  const RestApiScreen({super.key});

  @override
  State<RestApiScreen> createState() => _RestApiScreenState();
}

class _RestApiScreenState extends State<RestApiScreen> {

  final ProductController productController = ProductController();

  Future<void> fetchData() async {
    await productController.fetchProduct();
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void productAddShow() {

    TextEditingController productNameController = TextEditingController();
    TextEditingController imageController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController totalPriceController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) =>
          AlertDialog(
            title: Text('Add Product'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: productNameController,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    hintText: 'enter product name',
                  ),
                ),
                TextField(
                  controller: imageController,
                  decoration: InputDecoration(
                    labelText: 'Image',
                    hintText: 'enter image link',
                  ),
                ),
                TextField(
                  controller: quantityController,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    hintText: 'enter quantity',
                  ),
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    hintText: 'enter price',
                  ),
                ),
                TextField(
                  controller: totalPriceController,
                  decoration: InputDecoration(
                    labelText: 'Total Price',
                    hintText: 'enter total price',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                    ),
                    SizedBox(width: 5,),

                    ElevatedButton(
                      onPressed: () {
                        productController.createProduct(
                            productNameController.text, imageController.text,
                            int.parse(quantityController.text), int.parse(priceController.text),
                            int.parse(totalPriceController.text));
                        fetchData();
                        Navigator.pop(context);

                        setState(() {

                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          foregroundColor: Colors.white),
                      child: Text('Add Product'),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Rest Api 2',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: productController.productList.length,
        itemBuilder: (context, index) {
          final product = productController.productList[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              leading: Icon(Icons.image, size: 60),
              title: Text(
                '${product['ProductName']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Code: ${product['ProductCode']}'),
                  Text('Qty: ${product['Qty']}'),
                  Text('Price: ${product['UnitPrice']}'),
                  Text('Total Price: ${product['TotalPrice']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: Colors.grey),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => productAddShow(),
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
