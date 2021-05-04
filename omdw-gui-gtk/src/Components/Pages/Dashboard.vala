namespace OMDW.Gui.Widgets {

public class Dashboard : OMDW.Gui.GenericComponent {
  public Gtk.ListBox tasks_list;
  public Gtk.Box window_content_box;
  public Gtk.ApplicationWindow window;

  private void setup_widgets() {
    this.tasks_list = new Gtk.ListBox();
    this.window_content_box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
  }

  private void setup_window() {
    this.window = new Gtk.ApplicationWindow(this.application);
    this.window.set_default_size(485, 560);
    this.window.resizable = false;

    this.setup_widgets();

    this.window_content_box.show_all();
    this.window.add(this.window_content_box);
    this.window.present();
  }

  public void start() {
    this.setup_window();
    var builder = new Gtk.Builder.from_resource("/omdw/ui/dashboard-menu.ui");
    this.application.menubar = (GLib.MenuModel)builder.get_object("menubar");
  }
}

}
