import 'package:bloc_test_demo/value_object.dart';
import 'package:dartz/dartz.dart';

class ConcreteValueObject extends ValueObject<int> {
  factory ConcreteValueObject(int n) {
    assert(n != null);
    return ConcreteValueObject._(_validateConcreteValueObject(n));
  }

  const ConcreteValueObject._(value) : super(value);
}

Either<Failure, int> _validateConcreteValueObject(int n) {
  if (n == 0)
    return left(Failure()); // some validation (not important for demo)
  return right(n);
}
