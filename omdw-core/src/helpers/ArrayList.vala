// SPDX-License-Identifier: MIT

namespace OMDW.Core.Utils.ArrayList.Generic {

public Gee.ArrayList<T> _<T>() {
  var arr = new Gee.ArrayList<T>();
  return arr;
}

public Gee.ArrayList<T> _fromVector<T>(T[] data) {
  var arr = _<T>();
  arr.add_all_array(data);
  return arr;
}

public Gee.ArrayList<T> _fromIterator<T>(Gee.Iterator<T> iter) {
  var arr = _<T>();
  arr.add_all_iterator(iter);
  return arr;
}

}
