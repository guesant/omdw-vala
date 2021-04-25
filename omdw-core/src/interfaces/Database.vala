namespace OMDW.Core.Database {

public interface DatabaseSignals {
  public signal void on_update();
  public signal void on_tasks_change();
  public signal void on_task_added(string id);
  public signal void on_task_removed(string id);
  public signal void on_task_status_changed(string id);
}

public interface Database : Object, Signals {
  public abstract string getRawData();
  public abstract Json.Parser getData();
  public abstract void setData(Json.Node data);
  public abstract void setRawData(string data);
}

}