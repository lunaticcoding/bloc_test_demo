// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_test_demo/bloc/my_bloc_bloc.dart';
import 'package:bloc_test_demo/concrete_value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Note this was an imageFixture in my case. I just used an int
  // with Future.value to make it simpler for this demo.
  int asyncNumber; // or image data

  setUpAll(() async {
    asyncNumber = await Future.value(12);
  });

  blocTest(
    "demo test: the problem is that the ConcreteValueObject in the expected "
    "array gets initialized with the test suite. But because ValueObjects "
    "are non-nullable, the assert fails. Right now I could move the null "
    "check into the _validateConcreteValueObject. With Non-nullable objects "
    "which are coming soon to dart, this won't be an option (I would force "
    "unwrap in the tests then, because I know it will be valid because of"
    "the setUpAll). "
    ""
    "I also considered making the expected iterable a function but I was hesitant"
    "suggest breaking changes. ",
    build: () async => MyBlocBloc(),
    act: (bloc) async => bloc.add(MyConcreteBlocEvent(asyncNumber)),
    expect: [MyBlocSecondState(ConcreteValueObject(asyncNumber))],
  );

  int someOtherAsyncNumber;
  blocTest(
    "alternative",
    build: () async {
      someOtherAsyncNumber = await Future.value(23);
      return MyBlocBloc();
    },
    act: (bloc) async => bloc.add(MyConcreteBlocEvent(someOtherAsyncNumber)),
    expect: [MyBlocSecondState(ConcreteValueObject(someOtherAsyncNumber))],
  );
}
