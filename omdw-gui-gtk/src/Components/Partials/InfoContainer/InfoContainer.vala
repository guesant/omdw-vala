namespace OMDW.Gui.Widgets.Partials {

public class InfoContainer : Object {
  public Gtk.Image icon;
  public Gtk.Label label;

  public Gtk.Container container;

  construct {
    container = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);

    label = new Gtk.Label(null);
    icon = new Gtk.Image();

    container.add(icon);
    container.add(label);
  }
}

}