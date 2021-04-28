public class OMDW.Gui.Store : Object {
  public Core.CoreServices core_services;
  public Services.EventBus event_bus;
  public Services.Clipboard clipboard;

  public Store() {
    var services = new Core.CoreServices();
    var clipboard = new Services.Clipboard();
    var event_bus = new Gui.Services.EventBus();

    clipboard.on_clipboard_avaliable_text_change.connect((v) => {
      event_bus.on_clipboard_avaliable_text_change(v);
    });

    this.setup_store(services, event_bus, clipboard);
  }

  public void setup_store(
    Core.CoreServices core_services,
    Services.EventBus event_bus,
    Services.Clipboard clipboard
    ) {
    this.core_services = core_services;
    this.event_bus = event_bus;
    this.clipboard = clipboard;
  }

  public void setup_from_store(Store store) {
    this.setup_store(
      store.core_services,
      store.event_bus,
      store.clipboard
      );
  }
}
