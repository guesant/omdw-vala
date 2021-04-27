public class OMDW.Gui.Component : Object {
  public Store store;
  protected Gtk.Builder builder;
  public weak Gtk.Application application;

  protected unowned T get_obj<T>(string name) {
    return (T)builder.get_object(name);
  }
}
