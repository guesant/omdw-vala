// SPDX-License-Identifier: MIT

namespace OMDW.Core {

namespace xProcess.Spawn.WithPipes {

public struct Options.Struct {
  public string workingDir;
  public string[] spawn_env;
  public GenericArray<string> args;
}

public delegate void Struct(out Pid child_pid, Options.Struct options, out int? std_input, out int? std_output, out int? std_error) throws GLib.SpawnError;

public static Struct _(string commandBase) {
  return (out child_pid, options, out std_input, out std_output, out std_eror) => {
           options.args.insert(0, "%s".printf(commandBase));
           Process.spawn_async_with_pipes(options.workingDir, options.args.steal(), options.spawn_env, SpawnFlags.SEARCH_PATH | SpawnFlags.DO_NOT_REAP_CHILD, null, out child_pid, out std_input, out std_output, out std_eror);
  };
}

}

}