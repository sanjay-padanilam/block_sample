import 'package:bloc/bloc.dart';
import 'package:block_sample/model/product_res_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'fakestore_event.dart';
part 'fakestore_state.dart';

class FakestoreBloc extends Bloc<FakestoreEvent, FakestoreState> {
  FakestoreBloc() : super(FakestoreInitial()) {
    on<FetchproductsEvent>((event, emit) async {
      final url = Uri.parse('https://fakestoreapi.com/products');
      emit(onLoading());
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          onApisucess(productlist: productrResModelFromJson(response.body));
          //susecc
        } else {
          onApifail();
        } //fail
      } catch (e) {
        onException();
      } //error
    });
  }
}
