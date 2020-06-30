part of 'my_bloc_bloc.dart';

abstract class MyBlocState extends Equatable {
  const MyBlocState();
}

class MyBlocInitial extends MyBlocState {
  @override
  List<Object> get props => [];
}

class MyBlocSecondState extends MyBlocState {
  final ConcreteValueObject valueObject;
  MyBlocSecondState(this.valueObject);

  @override
  List<Object> get props => [valueObject];
}
