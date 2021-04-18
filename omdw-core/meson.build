# START DEPENDENCIES 
core_dependencies = [
  glib_dep,
]
# END DEPENDENCIES 

# START SOURCES

core_sources = files('setup.vala')


core_sources += files(
'src/interfaces/Task.Struct.Lexer.vala',
'src/interfaces/Task.Struct.vala',
)

subdir('src/utils')

# END SOURCES 

libcore_dep = declare_dependency(
    sources: core_sources,
    dependencies: core_dependencies)