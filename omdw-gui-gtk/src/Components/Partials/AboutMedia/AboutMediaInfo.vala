namespace OMDW.Gui.Widgets.Partials {

public enum AboutMediaInfoMode { OVERVIEW, DONE, ACTIVE, STOPPED;  }

public abstract class AboutMediaInfo : Object {
  public weak AboutMedia parent;
  public Gtk.Container container;
}

}