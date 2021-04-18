# START DEPENDENCIES 
gui_dependencies = [
  gio_dep,
  gmodule_dep,
]
# END DEPENDENCIES 

gresources = gnome.compile_resources(
  'project-resources',
  'resources/omdw.gresource.xml',
  c_name: 'proj_res',
  source_dir: ['resources']
)

# START SOURCES

gui_sources = files(
  'src/omdw.vala',
)

# END SOURCES

executable(
  'app',
  sources: [gui_sources, gresources],
  dependencies: gui_dependencies,
)
