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
include internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/depend.make

# Include the progress variables for this target.
include internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/progress.make

# Include the compile flags for this target's objects.
include internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/flags.make

internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o: internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/flags.make
internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o: ../internal/ceres/unsymmetric_linear_solver_test.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pang/software/okvis/3rdparts/ceres/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o"
	cd /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o -c /home/pang/software/okvis/3rdparts/ceres/internal/ceres/unsymmetric_linear_solver_test.cc

internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.i"
	cd /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pang/software/okvis/3rdparts/ceres/internal/ceres/unsymmetric_linear_solver_test.cc > CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.i

internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.s"
	cd /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pang/software/okvis/3rdparts/ceres/internal/ceres/unsymmetric_linear_solver_test.cc -o CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.s

internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o.requires:
.PHONY : internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o.requires

internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o.provides: internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o.requires
	$(MAKE) -f internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/build.make internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o.provides.build
.PHONY : internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o.provides

internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o.provides.build: internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o

# Object files for target unsymmetric_linear_solver_test
unsymmetric_linear_solver_test_OBJECTS = \
"CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o"

# External object files for target unsymmetric_linear_solver_test
unsymmetric_linear_solver_test_EXTERNAL_OBJECTS =

bin/unsymmetric_linear_solver_test: internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o
bin/unsymmetric_linear_solver_test: internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/build.make
bin/unsymmetric_linear_solver_test: lib/libtest_util.a
bin/unsymmetric_linear_solver_test: lib/libceres.a
bin/unsymmetric_linear_solver_test: lib/libgtest.a
bin/unsymmetric_linear_solver_test: /home/pang/catkin_ws/devel/lib/libspqr.a
bin/unsymmetric_linear_solver_test: /usr/lib/libtbb.so
bin/unsymmetric_linear_solver_test: /usr/lib/libtbbmalloc.so
bin/unsymmetric_linear_solver_test: /home/pang/catkin_ws/devel/lib/libcholmod.a
bin/unsymmetric_linear_solver_test: /home/pang/catkin_ws/devel/lib/libccolamd.a
bin/unsymmetric_linear_solver_test: /home/pang/catkin_ws/devel/lib/libcamd.a
bin/unsymmetric_linear_solver_test: /home/pang/catkin_ws/devel/lib/libcolamd.a
bin/unsymmetric_linear_solver_test: /home/pang/catkin_ws/devel/lib/libamd.a
bin/unsymmetric_linear_solver_test: /usr/lib/liblapack.so
bin/unsymmetric_linear_solver_test: /usr/lib/libf77blas.so
bin/unsymmetric_linear_solver_test: /usr/lib/libatlas.so
bin/unsymmetric_linear_solver_test: /home/pang/catkin_ws/devel/lib/libsuitesparseconfig.a
bin/unsymmetric_linear_solver_test: /usr/lib/x86_64-linux-gnu/librt.so
bin/unsymmetric_linear_solver_test: /usr/lib/liblapack.so
bin/unsymmetric_linear_solver_test: /usr/lib/libf77blas.so
bin/unsymmetric_linear_solver_test: /usr/lib/libatlas.so
bin/unsymmetric_linear_solver_test: /home/pang/catkin_ws/devel/lib/libsuitesparseconfig.a
bin/unsymmetric_linear_solver_test: /usr/lib/x86_64-linux-gnu/librt.so
bin/unsymmetric_linear_solver_test: /home/pang/catkin_ws/devel/lib/libgflags.so
bin/unsymmetric_linear_solver_test: /home/pang/catkin_ws/devel/lib/libglog.so
bin/unsymmetric_linear_solver_test: internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/unsymmetric_linear_solver_test"
	cd /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/unsymmetric_linear_solver_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/build: bin/unsymmetric_linear_solver_test
.PHONY : internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/build

internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/requires: internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/unsymmetric_linear_solver_test.cc.o.requires
.PHONY : internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/requires

internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/clean:
	cd /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres && $(CMAKE_COMMAND) -P CMakeFiles/unsymmetric_linear_solver_test.dir/cmake_clean.cmake
.PHONY : internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/clean

internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/depend:
	cd /home/pang/software/okvis/3rdparts/ceres/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pang/software/okvis/3rdparts/ceres /home/pang/software/okvis/3rdparts/ceres/internal/ceres /home/pang/software/okvis/3rdparts/ceres/build /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : internal/ceres/CMakeFiles/unsymmetric_linear_solver_test.dir/depend

