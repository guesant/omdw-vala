public interface OMDW.Gui.DashBoardSignals {
  public signal void on_request_quit();

  public signal void on_change_query_sort();
  public signal void on_change_query_filter();

  public signal void on_request_download(string? url);

  [CCode (instance_pos = -1)]
  public void quit(void *source) {
    this.on_request_quit();
  }

  [CCode (instance_pos = -1)]
  public void from_clipboard(void *source){
    this.on_request_download(null);
  }

  [CCode (instance_pos = -1)]
  public void sort_query(void *source) {
    this.on_change_query_sort();
  }

  [CCode (instance_pos = -1)]
  public void filter_query(void *source) {
    this.on_change_query_filter();
  }
}