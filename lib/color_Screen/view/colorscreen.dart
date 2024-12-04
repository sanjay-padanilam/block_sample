import 'package:block_sample/color_Screen/bloc/colorscreen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Colorscreen extends StatelessWidget {
  const Colorscreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.yellow,
      Colors.green,
      Colors.orange
    ];

    return BlocBuilder<ColorscreenBloc, ColorscreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.scaffoldbg,
          body: ListView.separated(
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        context
                            .read<ColorscreenBloc>()
                            .add(onColorchangeevent(newcolor: colors[index]));
                      },
                      child: Container(
                        height: 50,
                        color: colors[index],
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(),
              itemCount: colors.length),
        );
      },
    );
  }
}
