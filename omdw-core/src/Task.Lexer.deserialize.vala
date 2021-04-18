namespace OMDW.Core {

namespace Task.Lexer {

public Struct deserialize(Json.Object obj) {
  var status = Task.Status.from_int((int)obj.get_int_member("status"));
  return Task.Struct() {
           status = status,
           id = obj.get_string_member("id"),
           website_url = obj.get_string_member("website_url"),
           output_filename = obj.get_string_member("output_filename"),
           requested_formats = obj.get_string_member("requested_formats")
  };
}

}

}