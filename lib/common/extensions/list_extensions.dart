import '../common.dart';

extension ListExt<T> on List<T> {
  List<T> toResponseList(FromJsonT<T> fromJsonT) {
    List<T> value = <T>[];
    forEach((element) {
      value.add(fromJsonT(element));
    });
    return value;
  }

  List<T> replaceOrAdd(
    T obj,
    bool Function(T) identifier, {
    bool addWhenEmpty = true,
  }) {
    int index = indexWhere((element) => identifier(element) == identifier(obj));
    if (index >= 0) {
      removeAt(index);
      insert(index, obj);
    } else {
      if (addWhenEmpty) add(obj);
    }
    return this;
  }

  List<T> removeOrAdd(
    T obj,
    bool Function(T) identifier, {
    bool addWhenEmpty = true,
  }) {
    int index = indexWhere((element) => identifier(element) == identifier(obj));
    if (index >= 0) {
      removeAt(index);
    } else {
      if (addWhenEmpty) add(obj);
    }
    return this;
  }

  List<T> removeOrAddAll(
    List<T> objs,
    bool Function(T) identifier, {
    bool addWhenEmpty = true,
  }) {
    for (final obj in objs) {
      removeOrAdd(obj, identifier, addWhenEmpty: addWhenEmpty);
    }
    return this;
  }

  List<T> replaceOrAddAll(
    List<T> objs,
    bool Function(T) identifier, {
    bool addWhenEmpty = true,
  }) {
    for (final obj in objs) {
      replaceOrAdd(obj, identifier, addWhenEmpty: addWhenEmpty);
    }
    return this;
  }

  List<T> addUnique(
    List<T> listB,
    bool Function(T, T) identifier,
  ) {
    final result = <T>[];
    final seen = <T>{};

    for (final element in this) {
      if (!seen.contains(element)) {
        seen.add(element);
        result.add(element);
      }
    }

    for (final element in listB) {
      if (!seen.contains(element) && !any((a) => identifier(a, element))) {
        seen.add(element);
        result.add(element);
      }
    }

    return result;
  }

  List<T> unique<Id>([Id Function(T element)? id, bool inplace = true]) {
    final ids = <Id>{};
    final list = inplace ? this : List<T>.from(this);
    list.retainWhere((x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }

  List<T> clone() {
    return [...this];
  }

  List<T> spreadClone(List<T> list) {
    return [...list, ...this];
  }

  List<T> spreadAdd(T data) {
    return [...this, data];
  }
}

extension NullListExt<T> on List<T>? {
  List<T> clone() {
    return [...(this ?? [])];
  }

  List<T> spreadClone(List<T> list) {
    return [...list, ...this.clone()];
  }

  List<T> spreadAdd(T data) {
    return [...this.clone(), data];
  }
}
