public class OMDW.Gui.Utils.FileSystem {
  public static string getTempPath(string path) {
    return Path.build_filename(Environment.get_tmp_dir(), "omdw-temp-" + path);
  }
}