// SPDX-License-Identifier: MIT

namespace OMDW.Core.Formats {

public class Struct {
  public List<Format.Struct?> dashAudioFormats;
  public List<Format.Struct?> dashVideoFormats;

  public Struct() {
    this.setup();
  }

  public void setup() {
    this.dashAudioFormats = new List<Format.Struct?>();
    this.dashVideoFormats = new List<Format.Struct?>();
  }

  public static Struct from_json_array(Json.Array formats) {
    var fmts = new Struct();

    foreach(var element in formats.get_elements()) {
      var format = Format.from_ffmpeg_object(element.get_object());
      switch (format.mode) {
      case Format.Mode.ONLY_AUDIO: fmts.dashAudioFormats.append(format); break;
      case Format.Mode.ONLY_VIDEO: fmts.dashVideoFormats.append(format); break;
      }
    }

    fmts.dashVideoFormats.sort(Format.Utils.compareFormats);
    fmts.dashAudioFormats.sort(Format.Utils.compareFormats);
    fmts.dashVideoFormats.prepend(Format.Utils.create());
    fmts.dashAudioFormats.prepend(Format.Utils.create());

    return fmts;
  }
}

}