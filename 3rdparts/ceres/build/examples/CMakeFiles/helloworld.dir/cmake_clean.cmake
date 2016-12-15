FILE(REMOVE_RECURSE
  "CMakeFiles/helloworld.dir/helloworld.cc.o"
  "../bin/helloworld.pdb"
  "../bin/helloworld"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/helloworld.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
