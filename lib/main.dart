import 'package:block_sample/color_Screen/bloc/colorscreen_bloc.dart';
import 'package:block_sample/fakestore_Screen/bloc/fakestore_bloc.dart';

import 'package:block_sample/fakestore_Screen/view/fakestore.dart';
import 'package:block_sample/view/homescreen/bloc/homescreen_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => HomescreenBloc(),
      child: Container(),
    ),
    BlocProvider(
      create: (context) => ColorscreenBloc(),
      child: Container(),
    ),
    BlocProvider(
      create: (context) => FakestoreBloc()..add(FetchproductsEvent()),
      child: Container(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: fakestore_Screen(),
    );
  }
}
