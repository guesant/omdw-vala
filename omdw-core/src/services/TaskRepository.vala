public interface OMDW.Core.TaskRepository : Database.DatabaseSignals, Database.Database {
  public abstract void add_task(Task.Struct taskStruct);
  public signal void on_task_progress_changed(string id);
  public abstract Gee.ArrayList<Task.Struct?> get_tasks();
}
