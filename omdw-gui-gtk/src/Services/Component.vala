public class OMDW.Gui.Component : GenericComponent {
  protected Gtk.Builder builder;
  public bool dispose_widgets { get; set; default = true; }

  protected unowned T get_obj<T>(string name) {
    return (T)builder.get_object(name);
  }

  public new void dispose() {
    if(this.dispose_widgets && this.builder != null) {
      message("[omdw/debug]: component disposed!");
      foreach(var obj in this.builder.get_objects()) {
        if(obj != null && obj is Gtk.Widget) {
          ((Gtk.Widget)obj).destroy();
        }
      }
      this.builder.dispose();
      this.builder = null;
    }
    base.dispose();
  }

  ~Component() {
    this.dispose();
  }
}
