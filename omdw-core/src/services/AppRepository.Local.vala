public class OMDW.Core.AppRepository.Local : Database.Memory, TaskRepository {
  construct {
    this.defaultData = """{}""";
  }
}
