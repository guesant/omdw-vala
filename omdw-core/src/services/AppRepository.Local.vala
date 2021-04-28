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
}
