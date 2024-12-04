import 'package:block_sample/fakestore_Screen/bloc/fakestore_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class fakestore_Screen extends StatelessWidget {
  final List<Product> products = [
    Product(
      title: 'Product 1',
      description: 'This is a description of product 1.',
      price: 29.99,
      imageUrl:
          'https://images.pexels.com/photos/2536965/pexels-photo-2536965.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      title: 'Product 2',
      description: 'This is a description of product 2.',
      price: 49.99,
      imageUrl:
          'https://images.pexels.com/photos/2536965/pexels-photo-2536965.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      title: 'Product 3',
      description: 'This is a description of product 3.',
      price: 19.99,
      imageUrl:
          'https://images.pexels.com/photos/2536965/pexels-photo-2536965.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Listing'),
        ),
        body: BlocBuilder<FakestoreBloc, FakestoreState>(
            builder: (context, state) {
          if (state is onLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is onApisucess) {
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product: product);
              },
            );
          }
          if (state is onApifail || state is onException) {
            return Center(child: Text("failed"));
          }
          return SizedBox();
        }));
  }
}

class Product {
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
