public class OMDW.Core.AppRepository.Local : Database.Memory, TaskRepository {
  construct {
    this.defaultData = """{ "tasks": [] }""";
  }

  public Gee.ArrayList<Task.Struct?> get_tasks() {
    var root = this.get_json_data().get_root();
    var tasks = root.get_object().get_array_member("tasks");
    var list = new Gee.ArrayList<Task.Struct?>();
    foreach(var task in tasks.get_elements()) {
      list.add(Task.Lexer.struct_from_json(task.get_object()));
    }
    return list;
  }

  public void add_task(Task.Struct task_struct) {
    var json = this.get_json_data();
    var root = json.get_root();

    root.get_object()
    .get_array_member("tasks")
    .add_object_element(
      Task.Lexer
      .json_from_struct(task_struct)
      .get_object()
      );

    var generator = new Json.Generator();
    generator.set_root(root);
    this.set_raw_data(generator.to_data(null));

    this.on_task_added(task_struct.id, task_struct);
    this.on_tasks_change();
  }
}
