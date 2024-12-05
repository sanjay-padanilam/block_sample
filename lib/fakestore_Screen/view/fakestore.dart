import 'package:block_sample/fakestore_Screen/bloc/fakestore_bloc.dart';
import 'package:block_sample/fakestore_Screen/bloc/fakestore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class fakestore_Screen extends StatelessWidget {
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
            return ListView.builder(
              itemCount: state.productlist.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        state.productlist[index].image.toString(),
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
                              state.productlist[index].title.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              state.productlist[index].description.toString(),
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600]),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '\$${state.productlist[index].price.toString}',
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
              ),
            );
          }
          if (state is onApifail || state is onException) {
            return Center(child: Text("failed"));
          }
          return SizedBox();
        }));
  }
}
