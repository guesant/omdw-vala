namespace OMDW.Gui.Widgets.Partials.AboutMediaInfo {

public enum Mode { OVERVIEW, DONE, ACTIVE, STOPPED; }

public abstract class Skeleton : Object {
  public weak AboutMedia parent;
  public Gtk.Container container;
}

}