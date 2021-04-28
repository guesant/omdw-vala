namespace OMDW.Core.MediaController.ValidateRequest {

public Struct struct_from_json(Json.Object obj) {
  var infoStruct = Struct();
  infoStruct.is_valid = obj.get_boolean_member("isValid");
  infoStruct.is_playlist = obj.get_boolean_member("isPlaylist");
  return infoStruct;
}

public Struct? struct_from_string(string data) {
  var parser = new Json.Parser();
  try {
    parser.load_from_data(data);
    return struct_from_json(parser.get_root().get_object());
  } catch (Error e) {}
  return null;
}

public Json.Node json_from_struct(Struct infoStruct) {
  var builder = new Json.Builder();
  builder.begin_object();

  builder.set_member_name("isValid");
  builder.add_boolean_value(infoStruct.is_valid);

  builder.set_member_name("isPlaylist");
  builder.add_boolean_value(infoStruct.is_playlist);

  builder.end_object();
  return builder.get_root();
}

public string string_from_struct(Struct infoStruct) {
  var generator = new Json.Generator();
  generator.set_root(json_from_struct(infoStruct));
  return generator.to_data(null);
}

}