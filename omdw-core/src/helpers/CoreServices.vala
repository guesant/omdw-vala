// SPDX-License-Identifier: MIT

public class OMDW.Core.CoreServices {
  public xProcess.SpawnService YTDL;

  public CoreServices(string youtubedl = "youtube-dl") {
    this.YTDL = new xProcess.SpawnService(youtubedl);
  }
}
