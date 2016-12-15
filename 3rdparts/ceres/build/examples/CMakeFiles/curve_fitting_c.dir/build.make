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
CMAKE_SOURCE_DIR = /home/pang/software/okvis/3rdparts/ceres

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pang/software/okvis/3rdparts/ceres/build

# Include any dependencies generated for this target.
include examples/CMakeFiles/curve_fitting_c.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/curve_fitting_c.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/curve_fitting_c.dir/flags.make

examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o: examples/CMakeFiles/curve_fitting_c.dir/flags.make
examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o: ../examples/curve_fitting.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pang/software/okvis/3rdparts/ceres/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o"
	cd /home/pang/software/okvis/3rdparts/ceres/build/examples && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o   -c /home/pang/software/okvis/3rdparts/ceres/examples/curve_fitting.c

examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/curve_fitting_c.dir/curve_fitting.c.i"
	cd /home/pang/software/okvis/3rdparts/ceres/build/examples && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/pang/software/okvis/3rdparts/ceres/examples/curve_fitting.c > CMakeFiles/curve_fitting_c.dir/curve_fitting.c.i

examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/curve_fitting_c.dir/curve_fitting.c.s"
	cd /home/pang/software/okvis/3rdparts/ceres/build/examples && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/pang/software/okvis/3rdparts/ceres/examples/curve_fitting.c -o CMakeFiles/curve_fitting_c.dir/curve_fitting.c.s

examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o.requires:
.PHONY : examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o.requires

examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o.provides: examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o.requires
	$(MAKE) -f examples/CMakeFiles/curve_fitting_c.dir/build.make examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o.provides.build
.PHONY : examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o.provides

examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o.provides.build: examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o

# Object files for target curve_fitting_c
curve_fitting_c_OBJECTS = \
"CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o"

# External object files for target curve_fitting_c
curve_fitting_c_EXTERNAL_OBJECTS =

bin/curve_fitting_c: examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o
bin/curve_fitting_c: examples/CMakeFiles/curve_fitting_c.dir/build.make
bin/curve_fitting_c: lib/libceres.a
bin/curve_fitting_c: /home/pang/catkin_ws/devel/lib/libglog.so
bin/curve_fitting_c: /home/pang/catkin_ws/devel/lib/libspqr.a
bin/curve_fitting_c: /usr/lib/libtbb.so
bin/curve_fitting_c: /usr/lib/libtbbmalloc.so
bin/curve_fitting_c: /home/pang/catkin_ws/devel/lib/libcholmod.a
bin/curve_fitting_c: /home/pang/catkin_ws/devel/lib/libccolamd.a
bin/curve_fitting_c: /home/pang/catkin_ws/devel/lib/libcamd.a
bin/curve_fitting_c: /home/pang/catkin_ws/devel/lib/libcolamd.a
bin/curve_fitting_c: /home/pang/catkin_ws/devel/lib/libamd.a
bin/curve_fitting_c: /usr/lib/liblapack.so
bin/curve_fitting_c: /usr/lib/libf77blas.so
bin/curve_fitting_c: /usr/lib/libatlas.so
bin/curve_fitting_c: /home/pang/catkin_ws/devel/lib/libsuitesparseconfig.a
bin/curve_fitting_c: /usr/lib/x86_64-linux-gnu/librt.so
bin/curve_fitting_c: /usr/lib/liblapack.so
bin/curve_fitting_c: /usr/lib/libf77blas.so
bin/curve_fitting_c: /usr/lib/libatlas.so
bin/curve_fitting_c: /home/pang/catkin_ws/devel/lib/libsuitesparseconfig.a
bin/curve_fitting_c: /usr/lib/x86_64-linux-gnu/librt.so
bin/curve_fitting_c: examples/CMakeFiles/curve_fitting_c.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../bin/curve_fitting_c"
	cd /home/pang/software/okvis/3rdparts/ceres/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/curve_fitting_c.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/curve_fitting_c.dir/build: bin/curve_fitting_c
.PHONY : examples/CMakeFiles/curve_fitting_c.dir/build

examples/CMakeFiles/curve_fitting_c.dir/requires: examples/CMakeFiles/curve_fitting_c.dir/curve_fitting.c.o.requires
.PHONY : examples/CMakeFiles/curve_fitting_c.dir/requires

examples/CMakeFiles/curve_fitting_c.dir/clean:
	cd /home/pang/software/okvis/3rdparts/ceres/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/curve_fitting_c.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/curve_fitting_c.dir/clean

examples/CMakeFiles/curve_fitting_c.dir/depend:
	cd /home/pang/software/okvis/3rdparts/ceres/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pang/software/okvis/3rdparts/ceres /home/pang/software/okvis/3rdparts/ceres/examples /home/pang/software/okvis/3rdparts/ceres/build /home/pang/software/okvis/3rdparts/ceres/build/examples /home/pang/software/okvis/3rdparts/ceres/build/examples/CMakeFiles/curve_fitting_c.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/curve_fitting_c.dir/depend

