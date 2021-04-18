// SPDX-License-Identifier: MIT

namespace OMDW.Core {

public enum Format.Mode { BOTH, ONLY_AUDIO, ONLY_VIDEO }

public struct Format.Struct {
  public Format.Mode mode;
  public string format_id;
  public string formatedText;
}

}