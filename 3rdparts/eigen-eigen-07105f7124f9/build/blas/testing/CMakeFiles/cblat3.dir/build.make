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
include blas/testing/CMakeFiles/cblat3.dir/depend.make

# Include the progress variables for this target.
include blas/testing/CMakeFiles/cblat3.dir/progress.make

# Include the compile flags for this target's objects.
include blas/testing/CMakeFiles/cblat3.dir/flags.make

blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o: blas/testing/CMakeFiles/cblat3.dir/flags.make
blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o: ../blas/testing/cblat3.f
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building Fortran object blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/blas/testing && /usr/bin/gfortran  $(Fortran_DEFINES) $(Fortran_FLAGS) -c /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/blas/testing/cblat3.f -o CMakeFiles/cblat3.dir/cblat3.f.o

blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o.requires:
.PHONY : blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o.requires

blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o.provides: blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o.requires
	$(MAKE) -f blas/testing/CMakeFiles/cblat3.dir/build.make blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o.provides.build
.PHONY : blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o.provides

blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o.provides.build: blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o

# Object files for target cblat3
cblat3_OBJECTS = \
"CMakeFiles/cblat3.dir/cblat3.f.o"

# External object files for target cblat3
cblat3_EXTERNAL_OBJECTS =

blas/testing/cblat3: blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o
blas/testing/cblat3: blas/testing/CMakeFiles/cblat3.dir/build.make
blas/testing/cblat3: blas/libeigen_blas.so
blas/testing/cblat3: blas/testing/CMakeFiles/cblat3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking Fortran executable cblat3"
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/blas/testing && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cblat3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
blas/testing/CMakeFiles/cblat3.dir/build: blas/testing/cblat3
.PHONY : blas/testing/CMakeFiles/cblat3.dir/build

blas/testing/CMakeFiles/cblat3.dir/requires: blas/testing/CMakeFiles/cblat3.dir/cblat3.f.o.requires
.PHONY : blas/testing/CMakeFiles/cblat3.dir/requires

blas/testing/CMakeFiles/cblat3.dir/clean:
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/blas/testing && $(CMAKE_COMMAND) -P CMakeFiles/cblat3.dir/cmake_clean.cmake
.PHONY : blas/testing/CMakeFiles/cblat3.dir/clean

blas/testing/CMakeFiles/cblat3.dir/depend:
	cd /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9 /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/blas/testing /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/blas/testing /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/blas/testing/CMakeFiles/cblat3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : blas/testing/CMakeFiles/cblat3.dir/depend

