namespace OMDW.Gui.Widgets.Partials {

public class AboutMedia : OMDW.Gui.GenericComponent {
  public Gtk.Label duration;
  public Gtk.Grid container = new Gtk.Grid();
  public Gtk.Image thumbnail = new Gtk.Image();
  public Gtk.Label title = new Gtk.Label("Carregando...");
  public AboutMediaInfo.Skeleton? wrapper;

  construct {
    container.margin = 11;
    container.margin_end = 2;
    container.row_spacing = 7;
    container.column_spacing = 9;

    thumbnail.width_request = 80;
    thumbnail.height_request = 45;
    thumbnail.icon_name = "view-refresh";
    container.attach(thumbnail, 0, 0, 1, 2);

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

  public void set_generic_info(
    string? title = null,
    int64 duration = 0,
    string? thumbnail_url = null
    ) {
    this.title.label = title == null ? "Carregando..." : title;
    this.duration.label = Core.Utils.Time.format_seconds(duration);

    if(thumbnail_url != null) {
      GLib.Idle.add(() => {
          var pixbuf = Utils.pixbuf_from_url(thumbnail_url);
          if(pixbuf != null) {
            this.thumbnail.set_from_pixbuf(
              pixbuf.scale_simple(80, 45, Gdk.InterpType.BILINEAR)
              );
          }
          return false;
        });
    }
  }

  public void set_wrapper_mode (AboutMediaInfo.Mode mode) {
    if(this.wrapper != null) { this.wrapper.container.destroy(); }
    this.wrapper = AboutMediaInfo.get_wrapper_for_mode(mode);
    if(this.wrapper != null) {
      this.wrapper.parent = this;
      this.container.attach(this.wrapper.container, 2, 1, 1, 1);
    }
  }
}

}