namespace OMDW.Gui.Widgets.Partials {

public class AboutMedia : OMDW.Gui.GenericComponent {
  public Gtk.Label title;
  public Gtk.Grid container;
  public Gtk.Label duration;
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

    title = new Gtk.Label("Carregando...");
    title.halign = Gtk.Align.START;
    title.attributes = new Pango.AttrList();
    title.attributes.insert(Pango.attr_weight_new(Pango.Weight.BOLD));
    container.attach(title, 1, 0, 2, 1);

    var bx_duration = new InfoContainer(
      "0:00:00",
      );
    container.attach(bx_duration.container, 1, 1, 1, 1);
    duration = bx_duration.label;

    container.show_all();
  }
}

}