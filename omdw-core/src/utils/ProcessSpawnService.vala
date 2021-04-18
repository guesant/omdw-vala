// SPDX-License-Identifier: MIT

using OMDW.Core.xProcess.Spawn;

namespace OMDW.Core.xProcess {

public class SpawnService {
  public Sync.Struct spawn;
  public WithPipes.Struct spawnWithPipes;

  public void setupCommand(string command) {
    this.spawn = Sync._(command);
    this.spawnWithPipes = WithPipes._(command);
  }

  public SpawnService(string? command) {
    if(command != null) {
      this.setupCommand(command);
    }
  }

}

}