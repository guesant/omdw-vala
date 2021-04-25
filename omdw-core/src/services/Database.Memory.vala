namespace OMDW.Core.Database {

private void p_load_data(Json.Parser parser, string data) throws GLib.Error {
  parser.load_from_data(data);
}

public class Memory : RawDataDatabase {
  public override void set_json_data(Json.Node data) {
    var generator = new Json.Generator();
    generator.set_root(data);
    this.set_raw_data(generator.to_data(null));
  }

  public override Json.Parser get_json_data() {
    var parser = new Json.Parser();
    try { p_load_data(parser, this.get_raw_data()); }
    catch (Error e) {
      try { p_load_data(parser, this.defaultData); }
      catch (Error e) {}
    }
    return parser;
  }
}

protected abstract class RawDataDatabase : DatabaseSignals, Database, Object {
  private string? _raw_data;
  public string defaultData = "{}";

  public abstract Json.Parser get_json_data();
  public abstract void set_json_data(Json.Node data);

  public virtual string get_raw_data() {
    return _raw_data != null ? _raw_data : defaultData;
  }
  public virtual void set_raw_data(string data) {
    this._raw_data = data;
    this.on_update();
  }
}

}