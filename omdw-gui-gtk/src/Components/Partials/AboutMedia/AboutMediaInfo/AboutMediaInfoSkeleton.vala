namespace OMDW.Gui.Widgets.Partials.AboutMediaInfo {

public enum Mode { OVERVIEW, DONE, ACTIVE, STOPPED; }

public abstract class Skeleton : Object {
  public weak AboutMedia parent;
  public Gtk.Container container;
}

public static Skeleton? get_wrapper_for_mode(Mode mode) {
  switch (mode) {
  case Mode.OVERVIEW: return new AboutMediaInfo.Overview();
  }
  return null;
}

}