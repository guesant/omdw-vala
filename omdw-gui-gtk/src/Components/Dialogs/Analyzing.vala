namespace OMDW.Gui.Widgets.Dialog {

public class Analyzing : GenericComponent {
  public Analyzing(Gtk.Application application) {
    this.setup_generic_component(application);
  }

  public Gtk.Widget start() {
    var window = new Gtk.Dialog.with_buttons(
      "Analizando",
      null,
      Gtk.DialogFlags.MODAL,
      "Cancelar",
      Gtk.ResponseType.CANCEL
      );
    window.set_modal(true);
    window.set_default_size(310, 140);
    window.set_application(this.application);
    window.resizable = false;

    window.response.connect((id) => {
        switch (id) {
        case Gtk.ResponseType.CANCEL: window.destroy(); break;
        }
      });

    //
    var grid = new Gtk.Grid();
    grid.row_homogeneous = true;
    grid.column_homogeneous = true;
    grid.expand = true;

    var spinner = new Gtk.Spinner();
    spinner.active = true;
    grid.attach(spinner, 1, 1, 1, 1);

    window.get_content_area().add(grid);
    //

    window.show_all();
    return window;
  }
}

}