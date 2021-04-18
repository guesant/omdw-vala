// SPDX-License-Identifier: MIT

namespace OMDW.Core.Format {

private Format.Mode get_mode_from_object(Json.Object obj) {
  var acodec = obj.get_string_member("acodec");
  var vcodec = obj.get_string_member("vcodec");
  if(vcodec != "none" && acodec == "none") return Format.Mode.ONLY_AUDIO;
  else if(vcodec == "none" && acodec != "none") return Format.Mode.ONLY_VIDEO;
  else return Format.Mode.BOTH;
}

public static Struct fromFFmpegObject(Json.Object obj) {
  var format = Struct();

  format.mode = get_mode_from_object(obj);
  format.format_id = obj.get_string_member("format_id");

  var ext = obj.get_string_member("ext");

  switch (format.mode) {
  case Format.Mode.ONLY_AUDIO:
    var fps = (int)obj.get_int_member("fps");
    var width = (int)obj.get_int_member("width");
    var height = (int)obj.get_int_member("height");
    format.formatedText = "%s: %ix%i".printf(ext, width, height) + (fps == 30 ? "" : " %ifps".printf(fps));
    break;
  case Format.Mode.ONLY_VIDEO:
    var abr = (int)obj.get_int_member("abr");
    var asr = (int)obj.get_int_member("asr");
    format.formatedText = "%s: %i (%iHz)".printf(ext, abr, asr);
    break;
  case Format.Mode.BOTH:
    format.formatedText = obj.get_string_member("format_note");
    break;
  }

  return format;
}

}