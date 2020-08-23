// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Counter on _Counter, Store {
  Computed<String> _$msgComputed;

  @override
  String get msg => (_$msgComputed ??=
          Computed<String>(() => super.msg, name: '_Counter.msg'))
      .value;

  final _$countAtom = Atom(name: '_Counter.count');

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  final _$msgindicatorAtom = Atom(name: '_Counter.msgindicator');

  @override
  int get msgindicator {
    _$msgindicatorAtom.reportRead();
    return super.msgindicator;
  }

  @override
  set msgindicator(int value) {
    _$msgindicatorAtom.reportWrite(value, super.msgindicator, () {
      super.msgindicator = value;
    });
  }

  final _$_CounterActionController = ActionController(name: '_Counter');

  @override
  void increment() {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.reset');
    try {
      return super.reset();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count},
msgindicator: ${msgindicator},
msg: ${msg}
    ''';
  }
}
