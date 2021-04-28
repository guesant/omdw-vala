public class OMDW.Gui.GenericComponent : Object {
  public Store store;
  public weak Gtk.Application application;

  public void setup_generic_component(Gtk.Application application, Store? store = null) {
    this.application = application;
    if(store != null) {
      this.store = store;
    }
  }
}
