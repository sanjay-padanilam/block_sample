import 'package:block_sample/view/homescreen/bloc/homescreen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomescreenBloc>().add(onincrimentevent());
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: BlocBuilder<HomescreenBloc, HomescreenState>(
          builder: (context, state) {
            return Text(
              state.count.toString(),
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            );
          },
        ),
      ),
    );
  }
}
