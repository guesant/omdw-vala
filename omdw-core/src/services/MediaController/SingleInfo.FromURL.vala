namespace OMDW.Core.MediaController.SingleInfo {

public Struct? from_url(CoreServices services, string url) {
  try {
    int exit_status = 1;
    string exit_stdout;

    services.YTDL.get_spawn()(
      xProcess.Spawn
      .build_spawn_args(
        "--no-playlist -j",
        "\"%s\"".printf(url)
        ),
      out exit_stdout,
      out exit_status);

    if(exit_status == 0) {
      return SingleInfo.struct_from_string(exit_stdout);
    }
  } catch (Error e) {}
  return null;
}

}