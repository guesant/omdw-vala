namespace OMDW.Gui.Widgets.Partials.AboutMediaInfo {

public class Done : Skeleton {
  public Gtk.Label notes;
  public Gtk.Label filesize;

  construct {
    container = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 12);

    var box_filesize = new InfoContainer(
      null,
      );
    container.add(box_filesize.container);

    var box_notes = new InfoContainer(
      null,
      );
    container.add(box_notes.container);

    notes = box_notes.label;
    filesize = box_filesize.label;

    container.show_all();
  }
}

}