import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class IGamesStream<T> {
  final BehaviorSubject<T> _subject = BehaviorSubject<T>();

  Stream<T> get stream => _subject.stream;

  IGamesStream({T? initialData}) {
    if (initialData != null) add(initialData);
  }

  void add(T value) {
    _subject.add(value);
  }

  T? get value => _subject.valueOrNull;

  void addError(Object? value) {
    if (value != null) {
      _subject.addError(value);
    }
  }

  void handleFuture(Future future) => future
      .then(
        (value) => add(value),
      )
      .onError(
        (error, stackTrace) => addError(error),
      );

  Widget toBuild({
    required Widget Function(T data) onSuccess,
    required Widget onLoading,
    required Widget onError,
    dynamic data,
  }) {
    return StreamBuilder<T>(
      stream: stream,
      initialData: data,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return onSuccess(snapshot.data);
        } else if (snapshot.hasError) {
          return onError;
        } else {
          return onLoading;
        }
      },
    );
  }
}
