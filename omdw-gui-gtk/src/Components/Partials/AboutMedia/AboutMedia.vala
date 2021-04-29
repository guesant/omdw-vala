namespace OMDW.Gui.Widgets.Partials {

public class AboutMedia : OMDW.Gui.GenericComponent {
  public Gtk.Grid container;
  public Gtk.Image thumbnail;

  construct {
    container = new Gtk.Grid();
    container.margin = 11;
    container.margin_end = 2;
    container.row_spacing = 7;
    container.column_spacing = 9;

    thumbnail = new Gtk.Image();
    thumbnail.width_request = 80;
    thumbnail.height_request = 45;
    thumbnail.icon_name = "view-refresh";
    container.attach(thumbnail, 0, 0, 1, 2);

    container.show_all();
  }
}

}