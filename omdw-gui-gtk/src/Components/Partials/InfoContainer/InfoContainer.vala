namespace OMDW.Gui.Widgets.Partials {

public class InfoContainer : Object {
  public Gtk.Container container;

  public Gtk.Image icon = new Gtk.Image();
  public Gtk.Label label = new Gtk.Label(null);

  construct {
    container = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);
    container.add(icon);
    container.add(label);
  }

  public InfoContainer(
    string? initial_label_content = null,
    string? initial_icon_name = null
    ) {
    if(initial_label_content != null) {
      this.label.label = initial_label_content;
    }
    if(initial_icon_name != null) {
      this.icon.icon_name = initial_icon_name;
    }
  }
}

}