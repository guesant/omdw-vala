// SPDX-License-Identifier: MIT

namespace OMDW.Core {

public static void setupCore(string youtubedl = "youtube-dl") {
  Services.YTDL = new xProcess.SpawnService(youtubedl);
}

}
