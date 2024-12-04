import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'colorscreen_event.dart';
part 'colorscreen_state.dart';

class ColorscreenBloc extends Bloc<ColorscreenEvent, ColorscreenState> {
  ColorscreenBloc() : super(ColorscreenState()) {
    on<onColorchangeevent>((event, emit) {
      emit(ColorscreenState(scaffoldbg: event.newcolor));
    });
  }
}
