// SPDX-License-Identifier: MIT

namespace OMDW.Core.Format.Utils {

private string ext(Struct j) {
  return j.formatedText[0 : j.formatedText.index_of(":")];
}

public int compareFormats(Struct? a, Struct? b) {
  return strcmp(ext(a), ext(b));
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
  string[] excludeFromFormat = {
    "url",
    "protocol",
    "fragments",
    "player_url",
    "http_headers",
    "manifest_url",
    "fragment_base_url",
    "downloader_options",
  };
  foreach (var key in excludeFromFormat) obj.remove_member(key);
  return obj;
}

public Json.Array arr_simplify(Json.Array formats) {
  foreach(var format in formats.get_elements()) simplify(format.get_object());
  return formats;
}

}