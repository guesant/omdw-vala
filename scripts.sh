function scripts-usage() {
  cat <<\EOF
Usage:
$ scripts-setup
$ scripts-build
$ scripts-format
$ scripts-start [project] [executable]
$ scripts-build-and-start [project] [executable]
EOF
}

if [ -z ${HIDE_HELP+x} ]; then scripts-usage; fi;


function scripts-setup() {
  rm -rf builddir;
  meson setup builddir;
}

function scripts-start() {
  ./builddir/$1/$2
}

function scripts-build() {
  meson compile -C builddir;
}

function scripts-build-and-start() {
  clear;
  scripts-build && clear && scripts-start $1 $2;
}

function scripts-format() {
  if ! command -v COMMAND &> /dev/null
  then
    echo "uncrustify command not found - skipping staged files format"
  else 
    find . \( -name "*.vala" \) -exec uncrustify -q -c uncrustify.cfg --replace --no-backup {} +
  fi
}