part of 'my_bloc_bloc.dart';

abstract class MyBlocEvent extends Equatable {
  final int number;

  MyBlocEvent(this.number);
}

class MyConcreteBlocEvent extends MyBlocBloc {
  MyConcreteBlocEvent(number) : super();
}
