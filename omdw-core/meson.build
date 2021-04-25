# START DEPENDENCIES 
core_dependencies = [
  gee_dep,
  glib_dep,
  json_dep,
]
# END DEPENDENCIES 

# START SOURCES
core_sources = []
subdir('src')
# END SOURCES 

libcore_dep = declare_dependency(
    sources: core_sources,
    dependencies: core_dependencies)