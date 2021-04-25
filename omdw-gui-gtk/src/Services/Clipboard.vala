namespace OMDW.Gui.Services {

public interface ClipboardSignals {
  public signal void on_clipboard_avaliable_text_chage(bool is_avaliable);
}

public class Clipboard : ClipboardSignals, Object {
  public Gtk.Clipboard clipboard {
    get { return Gtk.Clipboard.get(Gdk.SELECTION_CLIPBOARD); }
  }

  public void clipboard_watch() {
    bool? prev = null;
    var cb = this.clipboard;
    while (true) {
      var avaliable = cb.wait_is_text_available();
      if(prev == null || avaliable != prev) {
        this.on_clipboard_avaliable_text_chage(avaliable);
      }
      prev = avaliable;
      Thread.usleep(1 * 1000000);
    }
  }
}

}
