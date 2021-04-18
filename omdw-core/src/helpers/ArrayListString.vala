namespace OMDW.Core.Utils.ArrayList.String {

public Gee.ArrayList<string> _fromVector(string[] data) {
  var arr = _();
  arr.add_all_array(data);
  return arr;
}

public Gee.ArrayList<string> _fromIterator(Gee.Iterator<string> iter) {
  var arr = _();
  arr.add_all_iterator(iter);
  return arr;
}

public Gee.ArrayList<string> _() {
  var arr = new Gee.ArrayList<string>((a,b) => str_equal(a, b));
  return arr;
}

}
