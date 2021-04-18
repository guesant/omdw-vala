// SPDX-License-Identifier: MIT

namespace OMDW.Core {

namespace Task.Lexer {

public Json.Node serialize(Struct taskStruct){
  var builder = new Json.Builder();
  builder.begin_object();

  builder.set_member_name("id");
  builder.add_string_value(taskStruct.id);

  builder.set_member_name("status");
  builder.add_int_value(taskStruct.status.as_int());

  builder.set_member_name("website_url");
  builder.add_string_value(taskStruct.website_url);

  builder.set_member_name("output_filename");
  builder.add_string_value(taskStruct.output_filename);

  builder.set_member_name("requested_formats");
  builder.add_string_value(taskStruct.requested_formats);

  builder.end_object();
  return builder.get_root();
}

}

}