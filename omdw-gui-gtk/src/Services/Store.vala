public class OMDW.Gui.Store : Object {
  public Services.EventBus event_bus;
  public Services.Clipboard clipboard;

  public Store() {
    var clipboard = new Services.Clipboard();
    var event_bus = new Gui.Services.EventBus();

    clipboard.on_clipboard_avaliable_text_change.connect((v) => {
      event_bus.on_clipboard_avaliable_text_change(v);
    });

    this.setup_store(event_bus, clipboard);
  }

  public void setup_store(
    Services.EventBus event_bus,
    Services.Clipboard clipboard
    ) {
    this.event_bus = event_bus;
    this.clipboard = clipboard;
  }

  public void setup_from_store(Store store) {
    this.setup_store(
      store.event_bus,
      store.clipboard
      );
  }
}
