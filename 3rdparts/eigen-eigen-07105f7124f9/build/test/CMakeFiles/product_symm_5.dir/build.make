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
include test/CMakeFiles/product_symm_5.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/product_symm_5.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/product_symm_5.dir/flags.make

test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o: test/CMakeFiles/product_symm_5.dir/flags.make
test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o: ../test/product_symm.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/product_symm_5.dir/product_symm.cpp.o -c /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/test/product_symm.cpp

test/CMakeFiles/product_symm_5.dir/product_symm.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/product_symm_5.dir/product_symm.cpp.i"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/test/product_symm.cpp > CMakeFiles/product_symm_5.dir/product_symm.cpp.i

test/CMakeFiles/product_symm_5.dir/product_symm.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/product_symm_5.dir/product_symm.cpp.s"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/test/product_symm.cpp -o CMakeFiles/product_symm_5.dir/product_symm.cpp.s

test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o.requires:
.PHONY : test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o.requires

test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o.provides: test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/product_symm_5.dir/build.make test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o.provides.build
.PHONY : test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o.provides

test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o.provides.build: test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o

# Object files for target product_symm_5
product_symm_5_OBJECTS = \
"CMakeFiles/product_symm_5.dir/product_symm.cpp.o"

# External object files for target product_symm_5
product_symm_5_EXTERNAL_OBJECTS =

test/product_symm_5: test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o
test/product_symm_5: test/CMakeFiles/product_symm_5.dir/build.make
test/product_symm_5: test/CMakeFiles/product_symm_5.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable product_symm_5"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/product_symm_5.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/product_symm_5.dir/build: test/product_symm_5
.PHONY : test/CMakeFiles/product_symm_5.dir/build

test/CMakeFiles/product_symm_5.dir/requires: test/CMakeFiles/product_symm_5.dir/product_symm.cpp.o.requires
.PHONY : test/CMakeFiles/product_symm_5.dir/requires

test/CMakeFiles/product_symm_5.dir/clean:
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/test && $(CMAKE_COMMAND) -P CMakeFiles/product_symm_5.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/product_symm_5.dir/clean

test/CMakeFiles/product_symm_5.dir/depend:
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9 /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/test /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/test /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/test/CMakeFiles/product_symm_5.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/product_symm_5.dir/depend

