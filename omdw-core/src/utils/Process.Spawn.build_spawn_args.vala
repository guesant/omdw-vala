// SPDX-License-Identifier: MIT

namespace OMDW.Core {

namespace xProcess.Spawn {

public static string build_spawn_args(string _base, ...) {
  var builder = new StringBuilder();
  builder.append(_base);

  var l = va_list();
  while (true) {
    string? key = l.arg();
    if (key == null) break;
    builder.append(" " + key);
  }

  return builder.str.chomp();
}

}

}