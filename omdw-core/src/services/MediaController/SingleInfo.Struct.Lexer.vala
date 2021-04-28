namespace OMDW.Core.MediaController.SingleInfo {

public Struct? struct_from_string(string data) {
  var parser = new Json.Parser();
  try {
    parser.load_from_data(data);
    return struct_from_json(parser.get_root().get_object());
  } catch (Error e) {}
  return null;
}

public Struct struct_from_json(Json.Object obj) {
  var infoStruct = Struct();
  infoStruct.title = obj.get_string_member("title");
  infoStruct.duration = obj.get_int_member("duration");
  infoStruct.thumbnail = obj.get_string_member("thumbnail");
  infoStruct.webpage_url = obj.get_string_member("webpage_url");
  infoStruct.formats = Format.Utils.arr_simplify(
    obj.get_array_member("formats")
    );
  return infoStruct;
}

public Json.Node json_from_struct(Struct infoStruct) {
  var builder = new Json.Builder();
  builder.begin_object();

  builder.set_member_name("title");
  builder.add_string_value(infoStruct.title);

  builder.set_member_name("duration");
  builder.add_int_value(infoStruct.duration);

  builder.set_member_name("thumbnail");
  builder.add_string_value(infoStruct.thumbnail);

  builder.set_member_name("webpage_url");
  builder.add_string_value(infoStruct.webpage_url);

  builder.set_member_name("formats");
  var node = new Json.Node(Json.NodeType.ARRAY);
  node.set_array(infoStruct.formats);
  builder.add_value(node);

  builder.end_object();
  return builder.get_root();
}

public string string_from_struct(Struct infoStruct) {
  var generator = new Json.Generator();
  generator.set_root(json_from_struct(infoStruct));
  return generator.to_data(null);
}

}