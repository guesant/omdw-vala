private Gdk.Pixbuf pixbuf_from_file(File file)
throws GLib.Error {
  return new Gdk.Pixbuf.from_file(file.get_path());
}

namespace OMDW.Gui.Utils {

public Gdk.Pixbuf? pixbuf_from_url(string image_url) {
  Gdk.Pixbuf? pixbuf = null;
  File file_local_copy = File.new_for_path(
    FileSystem.get_url_local_path(image_url)
    );

  if(file_local_copy.query_exists()) {
    try { pixbuf = pixbuf_from_file(file_local_copy); return pixbuf; }
    catch (Error e) {}
  }

  try {
    Core.Utils.make_file_copy_from_uri(image_url, file_local_copy);
    pixbuf = pixbuf_from_file(file_local_copy);
  } catch (Error e) {}

  return pixbuf;
}

}
