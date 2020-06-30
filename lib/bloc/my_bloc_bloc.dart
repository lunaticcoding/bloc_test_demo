import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../concrete_value_object.dart';

part 'my_bloc_event.dart';
part 'my_bloc_state.dart';

class MyBlocBloc extends Bloc<MyBlocEvent, MyBlocState> {
  @override
  MyBlocState get initialState => MyBlocInitial();

  @override
  Stream<MyBlocState> mapEventToState(
    MyBlocEvent event,
  ) async* {
    if (event is MyConcreteBlocEvent) {
      yield MyBlocSecondState(ConcreteValueObject(event.number));
    }
  }
}
