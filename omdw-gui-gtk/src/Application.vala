using OMDW;

public class OMDW.Gui.Application : Gtk.Application {
  public Gui.Store store;
  public Gui.Widgets.Dashboard dashboard;

  construct {
    this.store = new Gui.Store();
    this.dashboard = new Gui.Widgets.Dashboard(this.store, this);
    this.store.event_bus.on_request_download.connect(this.dashboard.download);
  }

  public Application() {
    Object(application_id: "io.github.guesant.omdw.gui.gtk");
  }

  protected override void activate() {
    dashboard.start();
    dashboard.window.destroy.connect(this.quit);
    new Thread<void>("clipboard_watch", this.store.clipboard.clipboard_watch);
  }
}
