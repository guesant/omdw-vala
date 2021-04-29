namespace OMDW.Gui.Widgets.Partials {

public class InfoContainer : Object {
  public Gtk.Image icon;
  public Gtk.Label label;

  public Gtk.Container container;

  construct {
    container = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);

    this.icon = new Gtk.Image();
    this.label = new Gtk.Label(null);

    container.add(label);
    container.add(icon);
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