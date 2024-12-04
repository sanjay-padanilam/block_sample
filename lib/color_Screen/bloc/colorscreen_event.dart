part of 'colorscreen_bloc.dart';

class ColorscreenEvent {}

class onColorchangeevent extends ColorscreenEvent {
  Color newcolor;

  onColorchangeevent({required this.newcolor});
}
