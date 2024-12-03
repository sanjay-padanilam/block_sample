import 'package:bloc/bloc.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  HomescreenBloc() : super(HomescreenState()) {
    on<ondecrementevent>((event, emit) {
      emit(HomescreenState(count: --state.count));
    });
    on<onincrimentevent>((event, emit) {
      emit(HomescreenState(count: ++state.count));
    });
  }
}
