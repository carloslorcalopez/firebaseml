// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chuck.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Chuck on _Chuck, Store {
  Computed<List<List<TextSpan>>> _$decoredComputed;

  @override
  List<List<TextSpan>> get decored =>
      (_$decoredComputed ??= Computed<List<List<TextSpan>>>(() => super.decored,
              name: '_Chuck.decored'))
          .value;

  final _$loadingAtom = Atom(name: '_Chuck.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$jokesAtom = Atom(name: '_Chuck.jokes');

  @override
  List<ChuckResponse> get jokes {
    _$jokesAtom.reportRead();
    return super.jokes;
  }

  @override
  set jokes(List<ChuckResponse> value) {
    _$jokesAtom.reportWrite(value, super.jokes, () {
      super.jokes = value;
    });
  }

  final _$searchAtom = Atom(name: '_Chuck.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$categoryAtom = Atom(name: '_Chuck.category');

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$categoriesAtom = Atom(name: '_Chuck.categories');

  @override
  List<String> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<String> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$initalizedAtom = Atom(name: '_Chuck.initalized');

  @override
  bool get initalized {
    _$initalizedAtom.reportRead();
    return super.initalized;
  }

  @override
  set initalized(bool value) {
    _$initalizedAtom.reportWrite(value, super.initalized, () {
      super.initalized = value;
    });
  }

  final _$decoredFullAtom = Atom(name: '_Chuck.decoredFull');

  @override
  List<List<TextSpan>> get decoredFull {
    _$decoredFullAtom.reportRead();
    return super.decoredFull;
  }

  @override
  set decoredFull(List<List<TextSpan>> value) {
    _$decoredFullAtom.reportWrite(value, super.decoredFull, () {
      super.decoredFull = value;
    });
  }

  final _$doGetCategoriesAsyncAction = AsyncAction('_Chuck.doGetCategories');

  @override
  Future doGetCategories() {
    return _$doGetCategoriesAsyncAction.run(() => super.doGetCategories());
  }

  final _$getRandomJokeAsyncAction = AsyncAction('_Chuck.getRandomJoke');

  @override
  Future getRandomJoke() {
    return _$getRandomJokeAsyncAction.run(() => super.getRandomJoke());
  }

  final _$getJokeByCategoryAsyncAction =
      AsyncAction('_Chuck.getJokeByCategory');

  @override
  Future getJokeByCategory() {
    return _$getJokeByCategoryAsyncAction.run(() => super.getJokeByCategory());
  }

  final _$_ChuckActionController = ActionController(name: '_Chuck');

  @override
  dynamic selectCategory(String selectedCategory) {
    final _$actionInfo =
        _$_ChuckActionController.startAction(name: '_Chuck.selectCategory');
    try {
      return super.selectCategory(selectedCategory);
    } finally {
      _$_ChuckActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic doSearch(String searchAux) {
    final _$actionInfo =
        _$_ChuckActionController.startAction(name: '_Chuck.doSearch');
    try {
      return super.doSearch(searchAux);
    } finally {
      _$_ChuckActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic doDelete(String id) {
    final _$actionInfo =
        _$_ChuckActionController.startAction(name: '_Chuck.doDelete');
    try {
      return super.doDelete(id);
    } finally {
      _$_ChuckActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
jokes: ${jokes},
search: ${search},
category: ${category},
categories: ${categories},
initalized: ${initalized},
decoredFull: ${decoredFull},
decored: ${decored}
    ''';
  }
}
