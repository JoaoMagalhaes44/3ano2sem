# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/jony/Desktop/CG/praticas/Semana7/code

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/jony/Desktop/CG/praticas/Semana7/build

# Include any dependencies generated for this target.
include CMakeFiles/class8.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/class8.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/class8.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/class8.dir/flags.make

CMakeFiles/class8.dir/main.cpp.o: CMakeFiles/class8.dir/flags.make
CMakeFiles/class8.dir/main.cpp.o: /Users/jony/Desktop/CG/praticas/Semana7/code/main.cpp
CMakeFiles/class8.dir/main.cpp.o: CMakeFiles/class8.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/jony/Desktop/CG/praticas/Semana7/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/class8.dir/main.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/class8.dir/main.cpp.o -MF CMakeFiles/class8.dir/main.cpp.o.d -o CMakeFiles/class8.dir/main.cpp.o -c /Users/jony/Desktop/CG/praticas/Semana7/code/main.cpp

CMakeFiles/class8.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/class8.dir/main.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jony/Desktop/CG/praticas/Semana7/code/main.cpp > CMakeFiles/class8.dir/main.cpp.i

CMakeFiles/class8.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/class8.dir/main.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jony/Desktop/CG/praticas/Semana7/code/main.cpp -o CMakeFiles/class8.dir/main.cpp.s

# Object files for target class8
class8_OBJECTS = \
"CMakeFiles/class8.dir/main.cpp.o"

# External object files for target class8
class8_EXTERNAL_OBJECTS =

class8: CMakeFiles/class8.dir/main.cpp.o
class8: CMakeFiles/class8.dir/build.make
class8: CMakeFiles/class8.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/jony/Desktop/CG/praticas/Semana7/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable class8"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/class8.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/class8.dir/build: class8
.PHONY : CMakeFiles/class8.dir/build

CMakeFiles/class8.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/class8.dir/cmake_clean.cmake
.PHONY : CMakeFiles/class8.dir/clean

CMakeFiles/class8.dir/depend:
	cd /Users/jony/Desktop/CG/praticas/Semana7/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/jony/Desktop/CG/praticas/Semana7/code /Users/jony/Desktop/CG/praticas/Semana7/code /Users/jony/Desktop/CG/praticas/Semana7/build /Users/jony/Desktop/CG/praticas/Semana7/build /Users/jony/Desktop/CG/praticas/Semana7/build/CMakeFiles/class8.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/class8.dir/depend

