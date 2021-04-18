namespace OMDW.Core.Task {

namespace Status {

public enum Struct { ACTIVE=0, STOPPED=1, DONE=2 }

public int to_int(Struct status) {
  switch(status) {
  case ACTIVE: return 0;
  case STOPPED: return 1;
  case DONE: return 2;
  }
  return 0;
}

public Struct from_int(int val) {
  switch(val) {
  case 0: return ACTIVE;
  case 1: return STOPPED;
  case 2: return DONE;
  }
  return ACTIVE;
}

}

}