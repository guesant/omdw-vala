public class OMDW.Gui.Utils.FileSystem {
  public static string get_url_local_path(string url) {
    return FileSystem.getTempPath(
      "thumbnail-" + Base64.encode(url.data)
      .replace("=", "_")
      .replace("/", ".")
      .replace("+", "-")
      );
  }

  public static string getTempPath(string path) {
    return Path.build_filename(Environment.get_tmp_dir(), "omdw-temp-" + path);
  }
}