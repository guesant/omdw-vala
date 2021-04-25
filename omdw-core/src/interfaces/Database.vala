namespace OMDW.Core.Database {

public interface DatabaseSignals {
  public signal void on_update();
  public signal void on_tasks_change();
  public signal void on_task_added(string id);
  public signal void on_task_removed(string id);
  public signal void on_task_status_changed(string id);
}

public interface Database : DatabaseSignals {
  public abstract string get_raw_data();
  public abstract Json.Parser get_json_data();
  public abstract void set_raw_data(string data);
  public abstract void set_json_data(Json.Node data);
}

}