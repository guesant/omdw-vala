# START DEPENDENCIES 
core_dependencies = [
  glib_dep,
]
# END DEPENDENCIES 

# START SOURCES

core_sources = files('setup.vala')

core_sources += files(
'src/Task.Lexer.serialize.vala',
'src/Task.Struct.vala',
'src/Task.Status.vala',
)

# END SOURCES 

libcore_dep = declare_dependency(
    sources: core_sources,
    dependencies: core_dependencies)