# DEPENDENCIES
gui_gtk_dependencies = [
  gio_dep,
  gtk_dep,
  glib_dep,
  gmodule_dep,
  libcore_dep,
]
# END DEPENDENCIES 

gresources = gnome.compile_resources(
  'project-resources',
  'resources/' + meson.project_name() + '.gresource.xml',
  c_name: 'proj_res',
  source_dir: ['resources']
)

# SOURCES
gui_gtk_sources = files('main.vala')
subdir('src')
# END SOURCES 

executable(
  'omdw-gui-gtk',
  sources: [gui_gtk_sources, gresources],
  dependencies: [gui_gtk_dependencies],
)