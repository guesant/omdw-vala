// SPDX-License-Identifier: MIT

namespace OMDW.Core {

namespace Task.Lexer {

public Struct deserialize(Json.Object obj) {
  var status = Task.status_from_int((int)obj.get_int_member("status"));
  return Task.Struct() {
           status = status,
           id = obj.get_string_member("id"),
           webpage_url = obj.get_string_member("webpage_url"),
           output_filename = obj.get_string_member("output_filename"),
           requested_formats = obj.get_string_member("requested_formats")
  };
}

public Json.Node serialize(Struct taskStruct){
  var builder = new Json.Builder();
  builder.begin_object();

  builder.set_member_name("id");
  builder.add_string_value(taskStruct.id);

  builder.set_member_name("status");
  builder.add_int_value(taskStruct.status.as_int());

  builder.set_member_name("webpage_url");
  builder.add_string_value(taskStruct.webpage_url);

  builder.set_member_name("output_filename");
  builder.add_string_value(taskStruct.output_filename);

  builder.set_member_name("requested_formats");
  builder.add_string_value(taskStruct.requested_formats);

  builder.end_object();
  return builder.get_root();
}

}

}