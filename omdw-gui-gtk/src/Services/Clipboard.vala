namespace OMDW.Gui.Services {

public interface ClipboardSignals {
  public signal void on_clipboard_avaliable_text_chage(bool is_avaliable);
}

public class Clipboard : ClipboardSignals, Object {
  public void clipboard_watch() {
    bool? prev = null;
    var clipboard = Gtk.Clipboard.get(Gdk.SELECTION_CLIPBOARD);
    while (true) {
      var avaliable = clipboard.wait_is_text_available();
      if(prev == null || avaliable != prev) {
        this.on_clipboard_avaliable_text_chage(avaliable);
      }
      prev = avaliable;
      Thread.usleep(1 * 1000000);
    }
  }
}

}
