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
include doc/snippets/CMakeFiles/compile_Cwise_log.dir/depend.make

# Include the progress variables for this target.
include doc/snippets/CMakeFiles/compile_Cwise_log.dir/progress.make

# Include the compile flags for this target's objects.
include doc/snippets/CMakeFiles/compile_Cwise_log.dir/flags.make

doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o: doc/snippets/CMakeFiles/compile_Cwise_log.dir/flags.make
doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o: doc/snippets/compile_Cwise_log.cpp
doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o: ../doc/snippets/Cwise_log.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/snippets && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o -c /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/snippets/compile_Cwise_log.cpp

doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.i"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/snippets && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/snippets/compile_Cwise_log.cpp > CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.i

doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.s"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/snippets && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/snippets/compile_Cwise_log.cpp -o CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.s

doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o.requires:
.PHONY : doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o.requires

doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o.provides: doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o.requires
	$(MAKE) -f doc/snippets/CMakeFiles/compile_Cwise_log.dir/build.make doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o.provides.build
.PHONY : doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o.provides

doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o.provides.build: doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o

# Object files for target compile_Cwise_log
compile_Cwise_log_OBJECTS = \
"CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o"

# External object files for target compile_Cwise_log
compile_Cwise_log_EXTERNAL_OBJECTS =

doc/snippets/compile_Cwise_log: doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o
doc/snippets/compile_Cwise_log: doc/snippets/CMakeFiles/compile_Cwise_log.dir/build.make
doc/snippets/compile_Cwise_log: doc/snippets/CMakeFiles/compile_Cwise_log.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable compile_Cwise_log"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/snippets && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/compile_Cwise_log.dir/link.txt --verbose=$(VERBOSE)
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/snippets && ./compile_Cwise_log >/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/snippets/Cwise_log.out

# Rule to build all files generated by this target.
doc/snippets/CMakeFiles/compile_Cwise_log.dir/build: doc/snippets/compile_Cwise_log
.PHONY : doc/snippets/CMakeFiles/compile_Cwise_log.dir/build

doc/snippets/CMakeFiles/compile_Cwise_log.dir/requires: doc/snippets/CMakeFiles/compile_Cwise_log.dir/compile_Cwise_log.cpp.o.requires
.PHONY : doc/snippets/CMakeFiles/compile_Cwise_log.dir/requires

doc/snippets/CMakeFiles/compile_Cwise_log.dir/clean:
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/snippets && $(CMAKE_COMMAND) -P CMakeFiles/compile_Cwise_log.dir/cmake_clean.cmake
.PHONY : doc/snippets/CMakeFiles/compile_Cwise_log.dir/clean

doc/snippets/CMakeFiles/compile_Cwise_log.dir/depend:
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9 /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/doc/snippets /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/snippets /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/doc/snippets/CMakeFiles/compile_Cwise_log.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/snippets/CMakeFiles/compile_Cwise_log.dir/depend

