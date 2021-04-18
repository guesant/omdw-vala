// SPDX-License-Identifier: MIT

namespace OMDW.Core {

namespace xProcess.Spawn.Sync {

public delegate void Struct(string args, out string _stdout, out int _exit_code, out string _stderr=null) throws GLib.SpawnError;

public static Struct _(string commandBase) {
  return (args, out _stdout, out _exit_code, out _stderr) => {
           Process.spawn_command_line_sync(
             build_spawn_args(commandBase, args),
             out _stdout,
             out _stderr,
             out _exit_code);
  };
}

}

}