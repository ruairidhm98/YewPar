# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /users/level4/2250079m/sandbox/YewParInstall/cmake-3.14.4-Linux-x86_64/bin/cmake

# The command to remove a file.
RM = /users/level4/2250079m/sandbox/YewParInstall/cmake-3.14.4-Linux-x86_64/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /users/level4/2250079m/sandbox/YewParInstall/YewPar

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /users/level4/2250079m/sandbox/YewParInstall/YewPar/build

# Include any dependencies generated for this target.
include lib/util/CMakeFiles/DistSetOnceFlag_component.dir/depend.make

# Include the progress variables for this target.
include lib/util/CMakeFiles/DistSetOnceFlag_component.dir/progress.make

# Include the compile flags for this target's objects.
include lib/util/CMakeFiles/DistSetOnceFlag_component.dir/flags.make

lib/util/CMakeFiles/DistSetOnceFlag_component.dir/DistSetOnceFlag.cpp.o: lib/util/CMakeFiles/DistSetOnceFlag_component.dir/flags.make
lib/util/CMakeFiles/DistSetOnceFlag_component.dir/DistSetOnceFlag.cpp.o: ../lib/util/DistSetOnceFlag.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/level4/2250079m/sandbox/YewParInstall/YewPar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/util/CMakeFiles/DistSetOnceFlag_component.dir/DistSetOnceFlag.cpp.o"
	cd /users/level4/2250079m/sandbox/YewParInstall/YewPar/build/lib/util && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/DistSetOnceFlag_component.dir/DistSetOnceFlag.cpp.o -c /users/level4/2250079m/sandbox/YewParInstall/YewPar/lib/util/DistSetOnceFlag.cpp

lib/util/CMakeFiles/DistSetOnceFlag_component.dir/DistSetOnceFlag.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DistSetOnceFlag_component.dir/DistSetOnceFlag.cpp.i"
	cd /users/level4/2250079m/sandbox/YewParInstall/YewPar/build/lib/util && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/level4/2250079m/sandbox/YewParInstall/YewPar/lib/util/DistSetOnceFlag.cpp > CMakeFiles/DistSetOnceFlag_component.dir/DistSetOnceFlag.cpp.i

lib/util/CMakeFiles/DistSetOnceFlag_component.dir/DistSetOnceFlag.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DistSetOnceFlag_component.dir/DistSetOnceFlag.cpp.s"
	cd /users/level4/2250079m/sandbox/YewParInstall/YewPar/build/lib/util && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/level4/2250079m/sandbox/YewParInstall/YewPar/lib/util/DistSetOnceFlag.cpp -o CMakeFiles/DistSetOnceFlag_component.dir/DistSetOnceFlag.cpp.s

# Object files for target DistSetOnceFlag_component
DistSetOnceFlag_component_OBJECTS = \
"CMakeFiles/DistSetOnceFlag_component.dir/DistSetOnceFlag.cpp.o"

# External object files for target DistSetOnceFlag_component
DistSetOnceFlag_component_EXTERNAL_OBJECTS =

lib/util/libhpx_DistSetOnceFlag.so: lib/util/CMakeFiles/DistSetOnceFlag_component.dir/DistSetOnceFlag.cpp.o
lib/util/libhpx_DistSetOnceFlag.so: lib/util/CMakeFiles/DistSetOnceFlag_component.dir/build.make
lib/util/libhpx_DistSetOnceFlag.so: /users/level4/2250079m/sandbox/YewParInstall/hpx-1.2.1/build/install/lib/libhpx_init.a
lib/util/libhpx_DistSetOnceFlag.so: /users/level4/2250079m/sandbox/YewParInstall/hpx-1.2.1/build/install/lib/libhpx.so.1.2.1
lib/util/libhpx_DistSetOnceFlag.so: /users/level4/2250079m/sandbox/YewParInstall/boost_1_70_0/stage/lib/libboost_atomic.so
lib/util/libhpx_DistSetOnceFlag.so: /users/level4/2250079m/sandbox/YewParInstall/boost_1_70_0/stage/lib/libboost_filesystem.so
lib/util/libhpx_DistSetOnceFlag.so: /users/level4/2250079m/sandbox/YewParInstall/boost_1_70_0/stage/lib/libboost_program_options.so
lib/util/libhpx_DistSetOnceFlag.so: /users/level4/2250079m/sandbox/YewParInstall/boost_1_70_0/stage/lib/libboost_regex.so
lib/util/libhpx_DistSetOnceFlag.so: /users/level4/2250079m/sandbox/YewParInstall/boost_1_70_0/stage/lib/libboost_system.so
lib/util/libhpx_DistSetOnceFlag.so: /usr/lib/x86_64-linux-gnu/libpthread.so
lib/util/libhpx_DistSetOnceFlag.so: /users/level4/2250079m/sandbox/YewParInstall/boost_1_70_0/stage/lib/libboost_atomic.so
lib/util/libhpx_DistSetOnceFlag.so: /users/level4/2250079m/sandbox/YewParInstall/boost_1_70_0/stage/lib/libboost_filesystem.so
lib/util/libhpx_DistSetOnceFlag.so: /users/level4/2250079m/sandbox/YewParInstall/boost_1_70_0/stage/lib/libboost_program_options.so
lib/util/libhpx_DistSetOnceFlag.so: /users/level4/2250079m/sandbox/YewParInstall/boost_1_70_0/stage/lib/libboost_regex.so
lib/util/libhpx_DistSetOnceFlag.so: /users/level4/2250079m/sandbox/YewParInstall/boost_1_70_0/stage/lib/libboost_system.so
lib/util/libhpx_DistSetOnceFlag.so: /usr/lib/x86_64-linux-gnu/libhwloc.so
lib/util/libhpx_DistSetOnceFlag.so: /usr/lib/x86_64-linux-gnu/libmpichcxx.so
lib/util/libhpx_DistSetOnceFlag.so: /usr/lib/x86_64-linux-gnu/libmpich.so
lib/util/libhpx_DistSetOnceFlag.so: /usr/lib/x86_64-linux-gnu/libpthread.so
lib/util/libhpx_DistSetOnceFlag.so: /usr/lib/x86_64-linux-gnu/libhwloc.so
lib/util/libhpx_DistSetOnceFlag.so: /usr/lib/x86_64-linux-gnu/libmpichcxx.so
lib/util/libhpx_DistSetOnceFlag.so: /usr/lib/x86_64-linux-gnu/libmpich.so
lib/util/libhpx_DistSetOnceFlag.so: lib/util/CMakeFiles/DistSetOnceFlag_component.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/level4/2250079m/sandbox/YewParInstall/YewPar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libhpx_DistSetOnceFlag.so"
	cd /users/level4/2250079m/sandbox/YewParInstall/YewPar/build/lib/util && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DistSetOnceFlag_component.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/util/CMakeFiles/DistSetOnceFlag_component.dir/build: lib/util/libhpx_DistSetOnceFlag.so

.PHONY : lib/util/CMakeFiles/DistSetOnceFlag_component.dir/build

lib/util/CMakeFiles/DistSetOnceFlag_component.dir/clean:
	cd /users/level4/2250079m/sandbox/YewParInstall/YewPar/build/lib/util && $(CMAKE_COMMAND) -P CMakeFiles/DistSetOnceFlag_component.dir/cmake_clean.cmake
.PHONY : lib/util/CMakeFiles/DistSetOnceFlag_component.dir/clean

lib/util/CMakeFiles/DistSetOnceFlag_component.dir/depend:
	cd /users/level4/2250079m/sandbox/YewParInstall/YewPar/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/level4/2250079m/sandbox/YewParInstall/YewPar /users/level4/2250079m/sandbox/YewParInstall/YewPar/lib/util /users/level4/2250079m/sandbox/YewParInstall/YewPar/build /users/level4/2250079m/sandbox/YewParInstall/YewPar/build/lib/util /users/level4/2250079m/sandbox/YewParInstall/YewPar/build/lib/util/CMakeFiles/DistSetOnceFlag_component.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/util/CMakeFiles/DistSetOnceFlag_component.dir/depend
