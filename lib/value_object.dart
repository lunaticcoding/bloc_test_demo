import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ValueObject<T> {
  final Either<Failure, T> _value;

  const ValueObject(this._value);
  Either<Failure, T> get value => _value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(), id);
  }

  Either<Failure, Unit> get failureOrUnit {
    return value.fold(
          (l) => left(l),
          (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UnexpectedValueError implements Exception {}

class Failure {
  // Would extend equatable and be abstract
}