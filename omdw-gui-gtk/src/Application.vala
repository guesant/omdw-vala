using OMDW;

public class OMDW.Gui.Application : Gtk.Application {
  public Gui.Store store;
  public Gui.Widgets.Dashboard dashboard;

  construct {
    this.store = new Gui.Store();
    this.dashboard = new Gui.Widgets.Dashboard();
    this.dashboard.setup_generic_component(this, this.store);
    this.store.event_bus.on_request_download.connect(this.download);
  }

  public Application() {
    Object(application_id: "io.github.guesant.omdw.gui.gtk");
  }

  private void setup_app_menu() {
    this.add_action_entries({
      {"quit", this.quit},
    }, this);

    var builder = new Gtk.Builder.from_resource("/omdw/ui/dashboard-menu.ui");
    this.app_menu = (GLib.MenuModel)builder.get_object("menubar");
  }

  protected override void startup() {
    base.startup();
    this.setup_app_menu();
  }

  protected override void activate() {
    dashboard.start();
    dashboard.window.destroy.connect(this.quit);
    new Thread<void>("clipboard_watch", this.store.clipboard.clipboard_watch);
  }
}
