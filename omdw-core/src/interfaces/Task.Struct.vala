// SPDX-License-Identifier: MIT

namespace OMDW.Core.Task {

public struct Struct {
  public string id;
  public Status status;
  public string website_url;
  public string output_filename;
  public string requested_formats;
}

public enum Status {
  ACTIVE=0, STOPPED=1, DONE=2;
  public int as_int() {
    return status_to_int(this);
  }
}

public int status_to_int(Status status) {
  switch(status) {
  case ACTIVE: return 0;
  case STOPPED: return 1;
  case DONE: return 2;
  }
  return 0;
}

public Status status_from_int(int val) {
  switch(val) {
  case 0: return ACTIVE;
  case 1: return STOPPED;
  case 2: return DONE;
  }
  return ACTIVE;
}

}