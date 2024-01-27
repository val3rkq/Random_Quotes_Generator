import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/repositories/repositories.dart';
part 'home_event.dart';
part 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DataRepository dataRepository = DataRepository();

  HomeBloc() : super(HomeInitial()) {
    on<GetData>((event, emit) async {
      emit(HomeLoading());

      try {

        // getting data
        Map<String, dynamic>? data = await dataRepository.getData();
        log(data.toString());
        if (data != null) {
          emit(HomeLoaded(data: data));
        } else {
          emit(HomeFailure(error: 'Data is not found!'));
        }
      } catch (e) {
        emit(HomeFailure(error: e.toString()));
      }
    });
  }
}