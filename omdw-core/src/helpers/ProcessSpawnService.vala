// SPDX-License-Identifier: MIT

using OMDW.Core.xProcess.Spawn;

namespace OMDW.Core.xProcess {

public class SpawnService {
  private string command;

  public void setCommand(string command) {
    this.command = command;
  }

  public Sync.Struct spawn() {
    return Sync._(this.command);
  }

  public WithPipes.Struct spawn_with_pipes() {
    return WithPipes._(this.command);
  }

  public SpawnService(string command) {
    this.setCommand(command);
  }

}

}