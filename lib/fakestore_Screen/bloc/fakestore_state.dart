import 'package:block_sample/model/product_res_model.dart';
import 'package:equatable/equatable.dart';

sealed class FakestoreState extends Equatable {
  const FakestoreState();

  @override
  List<Object> get props => [];
}

final class FakestoreInitial extends FakestoreState {}

final class onLoading extends FakestoreState {}

final class onApisucess extends FakestoreState {
  final List<ProductrResModel> productlist;
  onApisucess({required this.productlist});

  @override
  List<Object> get props => [productlist];
}

final class onApifail extends FakestoreState {}

final class onException extends FakestoreState {}
