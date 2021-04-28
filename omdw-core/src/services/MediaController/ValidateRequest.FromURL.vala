using OMDW.Core;

namespace OMDW.Core.MediaController.ValidateRequest {

public Struct from_url(
  CoreServices services,
  string url,
  bool playlist_mode = false
  ) {
  var result = Struct();

  result.is_valid = false;
  result.is_playlist = false;

  try {
    int exit_status;
    string exit_stdout;
    var args = "--get-title --skip-download \"%s\" %s".printf(url, playlist_mode ? "" : "--no-playlist");
    services.YTDL.get_spawn()(args, out exit_stdout, out exit_status);
    if(exit_status == 0) {
      result.is_valid = true;
      if(playlist_mode) {
        int items_count = exit_stdout.chomp().split("\n").length;
        result.is_playlist = items_count>0;
      }
    }
  } catch (Error e) {}
  return result;
}

}