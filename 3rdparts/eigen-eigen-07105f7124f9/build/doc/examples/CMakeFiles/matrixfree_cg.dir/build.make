# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/cmake-gui

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build

# Include any dependencies generated for this target.
include doc/examples/CMakeFiles/matrixfree_cg.dir/depend.make

# Include the progress variables for this target.
include doc/examples/CMakeFiles/matrixfree_cg.dir/progress.make

# Include the compile flags for this target's objects.
include doc/examples/CMakeFiles/matrixfree_cg.dir/flags.make

doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o: doc/examples/CMakeFiles/matrixfree_cg.dir/flags.make
doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o: ../doc/examples/matrixfree_cg.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/examples && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o -c /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/doc/examples/matrixfree_cg.cpp

doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.i"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/doc/examples/matrixfree_cg.cpp > CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.i

doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.s"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/doc/examples/matrixfree_cg.cpp -o CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.s

doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o.requires:
.PHONY : doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o.requires

doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o.provides: doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o.requires
	$(MAKE) -f doc/examples/CMakeFiles/matrixfree_cg.dir/build.make doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o.provides.build
.PHONY : doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o.provides

doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o.provides.build: doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o

# Object files for target matrixfree_cg
matrixfree_cg_OBJECTS = \
"CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o"

# External object files for target matrixfree_cg
matrixfree_cg_EXTERNAL_OBJECTS =

doc/examples/matrixfree_cg: doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o
doc/examples/matrixfree_cg: doc/examples/CMakeFiles/matrixfree_cg.dir/build.make
doc/examples/matrixfree_cg: doc/examples/CMakeFiles/matrixfree_cg.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable matrixfree_cg"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/matrixfree_cg.dir/link.txt --verbose=$(VERBOSE)
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/examples && ./matrixfree_cg >/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/examples/matrixfree_cg.out

# Rule to build all files generated by this target.
doc/examples/CMakeFiles/matrixfree_cg.dir/build: doc/examples/matrixfree_cg
.PHONY : doc/examples/CMakeFiles/matrixfree_cg.dir/build

doc/examples/CMakeFiles/matrixfree_cg.dir/requires: doc/examples/CMakeFiles/matrixfree_cg.dir/matrixfree_cg.cpp.o.requires
.PHONY : doc/examples/CMakeFiles/matrixfree_cg.dir/requires

doc/examples/CMakeFiles/matrixfree_cg.dir/clean:
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/examples && $(CMAKE_COMMAND) -P CMakeFiles/matrixfree_cg.dir/cmake_clean.cmake
.PHONY : doc/examples/CMakeFiles/matrixfree_cg.dir/clean

doc/examples/CMakeFiles/matrixfree_cg.dir/depend:
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9 /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/doc/examples /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/examples /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/examples/CMakeFiles/matrixfree_cg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/examples/CMakeFiles/matrixfree_cg.dir/depend

