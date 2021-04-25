// SPDX-License-Identifier: MIT

namespace OMDW.Core.xProcess {

public class SpawnService {
  private string command;

  public static Sync.Struct generate_sync_spawner (string cmd) {
    return (args, out _stdout, out _exit_code, out _stderr) => {
             Process.spawn_command_line_sync(
               Spawn.build_spawn_args(cmd, args),
               out _stdout,
               out _stderr,
               out _exit_code);
    };
  }

  public static WithPipes.Struct generate_async_spawner(string cmd) {
    return (out child_pid, options, out std_input, out std_output, out std_eror) => {
             options.args.insert(0, "%s".printf(cmd));
             Process.spawn_async_with_pipes(
               options.workingDir,
               options.args.steal(),
               options.spawn_env,
               SpawnFlags.SEARCH_PATH | SpawnFlags.DO_NOT_REAP_CHILD,
               null,
               out child_pid,
               out std_input,
               out std_output,
               out std_eror);
    };
  }

  public void setCommand(string command) {
    this.command = command;
  }

  public Sync.Struct get_spawn() {
    return SpawnService.generate_sync_spawner(this.command);
  }

  public WithPipes.Struct get_spawn_with_pipes() {
    return SpawnService.generate_async_spawner(this.command);
  }

  public SpawnService(string command) {
    this.setCommand(command);
  }

}

public delegate void Sync.Struct(string args, out string _stdout, out int _exit_code, out string _stderr=null) throws GLib.SpawnError;

public struct WithPipes.Options.Struct {
  public string workingDir;
  public string[] spawn_env;
  public GenericArray<string> args;
}

public delegate void WithPipes.Struct(out Pid child_pid, WithPipes.Options.Struct options, out int? std_input, out int? std_output, out int? std_error) throws GLib.SpawnError;

}