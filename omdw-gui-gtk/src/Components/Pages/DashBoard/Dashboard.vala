namespace OMDW.Gui.Widgets {

public class Dashboard : DashBoardSkeleton {
  public Dashboard(Store store, Gtk.Application application) {
    this.store = store;
    this.application = application;
  }

  public void start() {
    base.setup();
    this.on_request_quit.connect(window.destroy);
    this.window.present();
  }
}

}
