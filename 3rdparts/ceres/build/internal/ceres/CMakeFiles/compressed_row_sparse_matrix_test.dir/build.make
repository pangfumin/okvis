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
include internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/depend.make

# Include the progress variables for this target.
include internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/progress.make

# Include the compile flags for this target's objects.
include internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/flags.make

internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o: internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/flags.make
internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o: ../internal/ceres/compressed_row_sparse_matrix_test.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pang/software/okvis/3rdparts/ceres/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o"
	cd /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o -c /home/pang/software/okvis/3rdparts/ceres/internal/ceres/compressed_row_sparse_matrix_test.cc

internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.i"
	cd /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pang/software/okvis/3rdparts/ceres/internal/ceres/compressed_row_sparse_matrix_test.cc > CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.i

internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.s"
	cd /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pang/software/okvis/3rdparts/ceres/internal/ceres/compressed_row_sparse_matrix_test.cc -o CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.s

internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o.requires:
.PHONY : internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o.requires

internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o.provides: internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o.requires
	$(MAKE) -f internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/build.make internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o.provides.build
.PHONY : internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o.provides

internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o.provides.build: internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o

# Object files for target compressed_row_sparse_matrix_test
compressed_row_sparse_matrix_test_OBJECTS = \
"CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o"

# External object files for target compressed_row_sparse_matrix_test
compressed_row_sparse_matrix_test_EXTERNAL_OBJECTS =

bin/compressed_row_sparse_matrix_test: internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o
bin/compressed_row_sparse_matrix_test: internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/build.make
bin/compressed_row_sparse_matrix_test: lib/libtest_util.a
bin/compressed_row_sparse_matrix_test: lib/libceres.a
bin/compressed_row_sparse_matrix_test: lib/libgtest.a
bin/compressed_row_sparse_matrix_test: /home/pang/catkin_ws/devel/lib/libspqr.a
bin/compressed_row_sparse_matrix_test: /usr/lib/libtbb.so
bin/compressed_row_sparse_matrix_test: /usr/lib/libtbbmalloc.so
bin/compressed_row_sparse_matrix_test: /home/pang/catkin_ws/devel/lib/libcholmod.a
bin/compressed_row_sparse_matrix_test: /home/pang/catkin_ws/devel/lib/libccolamd.a
bin/compressed_row_sparse_matrix_test: /home/pang/catkin_ws/devel/lib/libcamd.a
bin/compressed_row_sparse_matrix_test: /home/pang/catkin_ws/devel/lib/libcolamd.a
bin/compressed_row_sparse_matrix_test: /home/pang/catkin_ws/devel/lib/libamd.a
bin/compressed_row_sparse_matrix_test: /usr/lib/liblapack.so
bin/compressed_row_sparse_matrix_test: /usr/lib/libf77blas.so
bin/compressed_row_sparse_matrix_test: /usr/lib/libatlas.so
bin/compressed_row_sparse_matrix_test: /home/pang/catkin_ws/devel/lib/libsuitesparseconfig.a
bin/compressed_row_sparse_matrix_test: /usr/lib/x86_64-linux-gnu/librt.so
bin/compressed_row_sparse_matrix_test: /usr/lib/liblapack.so
bin/compressed_row_sparse_matrix_test: /usr/lib/libf77blas.so
bin/compressed_row_sparse_matrix_test: /usr/lib/libatlas.so
bin/compressed_row_sparse_matrix_test: /home/pang/catkin_ws/devel/lib/libsuitesparseconfig.a
bin/compressed_row_sparse_matrix_test: /usr/lib/x86_64-linux-gnu/librt.so
bin/compressed_row_sparse_matrix_test: /home/pang/catkin_ws/devel/lib/libgflags.so
bin/compressed_row_sparse_matrix_test: /home/pang/catkin_ws/devel/lib/libglog.so
bin/compressed_row_sparse_matrix_test: internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/compressed_row_sparse_matrix_test"
	cd /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/compressed_row_sparse_matrix_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/build: bin/compressed_row_sparse_matrix_test
.PHONY : internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/build

internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/requires: internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/compressed_row_sparse_matrix_test.cc.o.requires
.PHONY : internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/requires

internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/clean:
	cd /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres && $(CMAKE_COMMAND) -P CMakeFiles/compressed_row_sparse_matrix_test.dir/cmake_clean.cmake
.PHONY : internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/clean

internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/depend:
	cd /home/pang/software/okvis/3rdparts/ceres/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pang/software/okvis/3rdparts/ceres /home/pang/software/okvis/3rdparts/ceres/internal/ceres /home/pang/software/okvis/3rdparts/ceres/build /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres /home/pang/software/okvis/3rdparts/ceres/build/internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : internal/ceres/CMakeFiles/compressed_row_sparse_matrix_test.dir/depend

