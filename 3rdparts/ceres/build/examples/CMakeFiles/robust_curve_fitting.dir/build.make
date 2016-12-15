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
include examples/CMakeFiles/robust_curve_fitting.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/robust_curve_fitting.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/robust_curve_fitting.dir/flags.make

examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o: examples/CMakeFiles/robust_curve_fitting.dir/flags.make
examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o: ../examples/robust_curve_fitting.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pang/software/okvis/3rdparts/ceres/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o"
	cd /home/pang/software/okvis/3rdparts/ceres/build/examples && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o -c /home/pang/software/okvis/3rdparts/ceres/examples/robust_curve_fitting.cc

examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.i"
	cd /home/pang/software/okvis/3rdparts/ceres/build/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pang/software/okvis/3rdparts/ceres/examples/robust_curve_fitting.cc > CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.i

examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.s"
	cd /home/pang/software/okvis/3rdparts/ceres/build/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pang/software/okvis/3rdparts/ceres/examples/robust_curve_fitting.cc -o CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.s

examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o.requires:
.PHONY : examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o.requires

examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o.provides: examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o.requires
	$(MAKE) -f examples/CMakeFiles/robust_curve_fitting.dir/build.make examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o.provides.build
.PHONY : examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o.provides

examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o.provides.build: examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o

# Object files for target robust_curve_fitting
robust_curve_fitting_OBJECTS = \
"CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o"

# External object files for target robust_curve_fitting
robust_curve_fitting_EXTERNAL_OBJECTS =

bin/robust_curve_fitting: examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o
bin/robust_curve_fitting: examples/CMakeFiles/robust_curve_fitting.dir/build.make
bin/robust_curve_fitting: lib/libceres.a
bin/robust_curve_fitting: /home/pang/catkin_ws/devel/lib/libglog.so
bin/robust_curve_fitting: /home/pang/catkin_ws/devel/lib/libspqr.a
bin/robust_curve_fitting: /usr/lib/libtbb.so
bin/robust_curve_fitting: /usr/lib/libtbbmalloc.so
bin/robust_curve_fitting: /home/pang/catkin_ws/devel/lib/libcholmod.a
bin/robust_curve_fitting: /home/pang/catkin_ws/devel/lib/libccolamd.a
bin/robust_curve_fitting: /home/pang/catkin_ws/devel/lib/libcamd.a
bin/robust_curve_fitting: /home/pang/catkin_ws/devel/lib/libcolamd.a
bin/robust_curve_fitting: /home/pang/catkin_ws/devel/lib/libamd.a
bin/robust_curve_fitting: /usr/lib/liblapack.so
bin/robust_curve_fitting: /usr/lib/libf77blas.so
bin/robust_curve_fitting: /usr/lib/libatlas.so
bin/robust_curve_fitting: /home/pang/catkin_ws/devel/lib/libsuitesparseconfig.a
bin/robust_curve_fitting: /usr/lib/x86_64-linux-gnu/librt.so
bin/robust_curve_fitting: /usr/lib/liblapack.so
bin/robust_curve_fitting: /usr/lib/libf77blas.so
bin/robust_curve_fitting: /usr/lib/libatlas.so
bin/robust_curve_fitting: /home/pang/catkin_ws/devel/lib/libsuitesparseconfig.a
bin/robust_curve_fitting: /usr/lib/x86_64-linux-gnu/librt.so
bin/robust_curve_fitting: examples/CMakeFiles/robust_curve_fitting.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../bin/robust_curve_fitting"
	cd /home/pang/software/okvis/3rdparts/ceres/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/robust_curve_fitting.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/robust_curve_fitting.dir/build: bin/robust_curve_fitting
.PHONY : examples/CMakeFiles/robust_curve_fitting.dir/build

examples/CMakeFiles/robust_curve_fitting.dir/requires: examples/CMakeFiles/robust_curve_fitting.dir/robust_curve_fitting.cc.o.requires
.PHONY : examples/CMakeFiles/robust_curve_fitting.dir/requires

examples/CMakeFiles/robust_curve_fitting.dir/clean:
	cd /home/pang/software/okvis/3rdparts/ceres/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/robust_curve_fitting.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/robust_curve_fitting.dir/clean

examples/CMakeFiles/robust_curve_fitting.dir/depend:
	cd /home/pang/software/okvis/3rdparts/ceres/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pang/software/okvis/3rdparts/ceres /home/pang/software/okvis/3rdparts/ceres/examples /home/pang/software/okvis/3rdparts/ceres/build /home/pang/software/okvis/3rdparts/ceres/build/examples /home/pang/software/okvis/3rdparts/ceres/build/examples/CMakeFiles/robust_curve_fitting.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/robust_curve_fitting.dir/depend

