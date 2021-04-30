public class OMDW.Gui.Utils.FileSystem {
  public static string get_url_local_path(string url) {
    return FileSystem.get_temp_path(
      "thumbnail-" + Base64.encode(url.data)
      .replace("=", "_")
      .replace("/", ".")
      .replace("+", "-")
      );
  }

  public static string get_temp_path(string path) {
    return Path.build_filename(Environment.get_tmp_dir(), "omdw-temp-" + path);
  }

  public static string get_cache_path(string path) {
    return Path.build_filename(Environment.get_user_cache_dir(), "omdw-cache-" + path);
  }
}