function s:setup() {
  rm -rf builddir;
  meson setup builddir;
}

function s:build() {
  meson compile -C builddir;
}

function s:start() {
  ./builddir/$1/$2
}

function s:build-start() {
  clear;
  s:build && clear && s:start $1 $2;
}

function s:format() {
  if ! command -v uncrustify &> /dev/null
  then
    echo "uncrustify command not found - skipping staged files format"
  else 
    find . \( -name "*.vala" \) -exec uncrustify -q -c uncrustify.cfg --replace --no-backup {} +
  fi
}