# DEPENDENCIES
gui_gtk_dependencies = [
  gio_dep,
  gtk_dep,
  glib_dep,
  gmodule_dep,
]
# END DEPENDENCIES 

gresources = gnome.compile_resources(
  'project-resources',
  'resources/omdw.gresource.xml',
  c_name: 'proj_res',
  source_dir: ['resources']
)

# SOURCES
gui_gtk_sources = files('main.vala')
gui_gtk_sources += files('src/Application.vala')
subdir('src/Services')
# END SOURCES 

executable(
  'omdw-gui-gtk',
  sources: [gui_gtk_sources, gresources],
  dependencies: [gui_gtk_dependencies],
)