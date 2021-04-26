// SPDX-License-Identifier: MIT

namespace OMDW.Core.Format.Utils {

private string get_ext_from_formatted_text(string text) {
  return text[0 : text.index_of(":")];
}

private string get_ext_from_struct(Struct j) {
  return get_ext_from_formatted_text(j.formatedText);
}

public int compareFormats(Struct? a, Struct? b) {
  return strcmp(get_ext_from_struct(a), get_ext_from_struct(b));
}

public Format.Struct create(
  string formattedText="Nenhum",
  string format_id="-1",
  Format.Mode mode = Format.Mode.BOTH
  ) {
  return Format.Struct(){
           mode=mode,
           format_id=format_id,
           formatedText=formattedText
  };
}

public Json.Object simplify(Json.Object obj) {
  string[8] excludeFromFormat = {
    "url",
    "protocol",
    "fragments",
    "player_url",
    "http_headers",
    "manifest_url",
    "fragment_base_url",
    "downloader_options",
  };
  foreach (var key in excludeFromFormat) {
    obj.remove_member(key);
  }
  return obj;
}

public Json.Array arr_simplify(Json.Array formats) {
  foreach(var format in formats.get_elements()) {
    simplify(format.get_object());
  }
  return formats;
}

}