namespace OMDW.Gui.Widgets.Partials.AboutMediaInfo {

public class Stopped : Skeleton {
  construct {
    var box = new InfoContainer(
      "Status: Pausado.",
      "gtk-media-pause"
      );
    container = box.container;
    container.show_all();
  }
}

}