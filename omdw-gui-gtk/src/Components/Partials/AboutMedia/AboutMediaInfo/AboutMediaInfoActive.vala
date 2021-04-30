namespace OMDW.Gui.Widgets.Partials.AboutMediaInfo {

public class Active : Skeleton {
  public Gtk.Label notes = new Gtk.Label(null);
  public Gtk.ProgressBar progressbar = new Gtk.ProgressBar();

  construct {
    container = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 12);

    var progress_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);
    var progressbar_icon = new Gtk.Image();
    progressbar_icon.set_from_resource("/omdw/icons/downloading.svg");
    progressbar.valign = Gtk.Align.CENTER;
    progress_box.add(progressbar_icon);
    progress_box.add(progressbar);

    container.add(progress_box);
    container.add(notes);
    container.show_all();
  }
}

}