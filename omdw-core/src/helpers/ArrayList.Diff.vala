namespace OMDW.Core.Utils.ArrayList.Utils.Diff {

public struct Struct<T> {
  Gee.ArrayList<T> added;
  Gee.ArrayList<T> removed;
}

public Struct getDiff<T>(Gee.ArrayList<T> _prev, Gee.ArrayList<T> _current) {
  var diff = Struct<T>();

  diff.added = Generic._fromIterator(
    _current.filter(i => !_prev.contains(i))
    );
  diff.removed = Generic._fromIterator(
    _prev.filter(i => !_current.contains(i))
    );

  return diff;
}

}