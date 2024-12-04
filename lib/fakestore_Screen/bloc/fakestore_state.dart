part of 'fakestore_bloc.dart';

sealed class FakestoreState extends Equatable {
  const FakestoreState();

  @override
  List<Object> get props => [];
}

final class FakestoreInitial extends FakestoreState {}

final class onLoading extends FakestoreState {}

final class onApisucess extends FakestoreState {
  List<ProductrResModel> productlist;
  onApisucess({required this.productlist});

  @override
  List<Object> get props => [productlist];
}

final class onApifail extends FakestoreState {}

final class onException extends FakestoreState {}
