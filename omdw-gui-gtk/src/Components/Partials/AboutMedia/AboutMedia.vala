namespace OMDW.Gui.Widgets.Partials {

public class AboutMedia : OMDW.Gui.GenericComponent {
  public Gtk.Grid container;

  construct {
    container = new Gtk.Grid();
    container.margin = 11;
    container.margin_end = 2;
    container.row_spacing = 7;
    container.column_spacing = 9;
    container.show_all();
  }
}

}