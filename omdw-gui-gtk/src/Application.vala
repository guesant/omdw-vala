using OMDW;

public class OMDW.Gui.Application : Gtk.Application {
  public Gui.Store store;

  construct {
    this.store = new Gui.Store();
  }

  public Application() {
    Object(application_id: "io.github.guesant.omdw.gui.gtk");
  }
  protected override void activate() {
    new Thread<void>("clipboard_watch", this.store.clipboard.clipboard_watch);
  }
}
