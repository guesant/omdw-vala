namespace OMDW.Gui.Widgets.Dialog {

public class TipClipboardUsage : OMDW.Gui.GenericComponent {
  public void start() {
    var window = new Gtk.Window();

    // setup window
    window.set_modal(true);
    window.resizable = false;
    window.urgency_hint = true;
    window.set_application(this.application);
    window.title = "Baixar da Área de Transferência";

    // window content

    var container = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
    container.margin = 5;
    container.margin_end = 11;

    var hint_icon = new Gtk.Image.from_icon_name("gtk-about", Gtk.IconSize.BUTTON);
    hint_icon.pixel_size = 32;
    hint_icon.margin=11;

    var hint_label = new Gtk.Label(null);
    hint_label.label = "Copie a URL da mídia que faremos o resto!";
    hint_label.max_width_chars = 20;

    //
    container.add(hint_icon);
    container.add(hint_label);
    //

    container.show_all();
    window.add(container);

    var loop = new MainLoop();
    window.destroy.connect(loop.quit);
    window.present();
    loop.run();
  }
}

}