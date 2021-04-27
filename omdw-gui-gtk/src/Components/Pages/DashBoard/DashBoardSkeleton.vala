namespace OMDW.Gui.Widgets {

public class DashBoardSkeleton : OMDW.Gui.Component, DashBoardSignals {
  public void setup() {
    builder = new Gtk.Builder.from_resource("/omdw/ui/dashboard.ui");
    btn_toggle_sort_order.active = true;
    window.set_application(this.application);
    builder.connect_signals(this);
  }

  public Gtk.Button btn_action_paste {
    get { return get_obj<Gtk.Button>("btn-from-clipboard"); }
  }

  public Gtk.ApplicationWindow window {
    get { return get_obj<Gtk.ApplicationWindow>("window"); }
  }
  public Gtk.ToggleButton btn_toggle_sort_order {
    get { return get_obj<Gtk.ToggleButton>("query-sort-order"); }
  }

}

}