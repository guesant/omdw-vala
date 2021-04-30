using OMDW.Core.MediaController;

namespace OMDW.Gui.Widgets.Partials.AboutMediaInfo {

public class Overview : Skeleton {
  public Gtk.Label url;

  construct {
    container = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 12);

    var box_url = new InfoContainer(
      "...",
      );
    container.add(box_url.container);
    url = box_url.label;

    container.show_all();
  }

  public void set_info_from_struct(SingleInfo.Struct info_struct) {
    url.label = info_struct.webpage_url;
    parent.set_generic_info(
      info_struct.title,
      info_struct.duration,
      info_struct.thumbnail);
  }
}

}