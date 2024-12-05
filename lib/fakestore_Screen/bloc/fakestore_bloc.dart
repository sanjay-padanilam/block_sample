import 'package:bloc/bloc.dart';
import 'package:block_sample/fakestore_Screen/bloc/fakestore_state.dart';
import 'package:block_sample/model/product_res_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'fakestore_event.dart';

class FakestoreBloc extends Bloc<FakestoreEvent, FakestoreState> {
  FakestoreBloc() : super(FakestoreInitial()) {
    on<FetchproductsEvent>((event, emit) async {
      final url = Uri.parse('https://fakestoreapi.com/products');
      emit(onLoading());
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          emit(onApisucess(
              productlist: productrResModelFromJson(response.body)));

          //susecc
        } else {
          emit(onApifail());
        } //fail
      } catch (e) {
        emit(onException());
      } //error
    });
  }
}
