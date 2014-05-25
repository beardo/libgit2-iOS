# force CMake to assume crosscompiling
set(CMAKE_CROSSCOMPILING 1)

# We're building for iOS on OSX
set(CMAKE_SYSTEM_NAME Darwin)
set(CMAKE_SYSTEM_PROCESSOR arm )
set(APPLE 1)
set(IOS 1)

# use clang not gcc
set(CMAKE_C_COMPILER   "${IOS_DEVELOPER_ROOT}/usr/bin/clang"    CACHE PATH "C compiler" FORCE)
set(CMAKE_CXX_COMPILER "${IOS_DEVELOPER_ROOT}/usr/bin/clang++"  CACHE PATH "C++ compiler" FORCE)

# Not sure of a good way to automatically find this information
set(IOS_SDK_VERSION "7")
set(IOS_TARGET "iPhoneOS")
set(IOS_ARCH "i386")
set(CMAKE_OSX_ARCHITECTURES "${IOS_ARCH}" CACHE STRING "SDK Architecture" FORCE)

find_program(CMAKE_XCODE_SELECT xcode-select)
if(CMAKE_XCODE_SELECT)
	execute_process(COMMAND ${CMAKE_XCODE_SELECT} "-print-path" OUTPUT_VARIABLE OSX_DEVELOPER_ROOT OUTPUT_STRIP_TRAILING_WHITESPACE)
endif()

# Figure out path stuff
set(IOS_DEVELOPER_ROOT "${OSX_DEVELOPER_ROOT}/Platforms/${IOS_TARGET}.platform/Developer")
set(IOS_SDK_ROOT "${IOS_DEVELOPER_ROOT}/SDKs/${IOS_TARGET}${IOS_SDK_VERSION}.sdk")


# default to searching for frameworks first
set (CMAKE_FIND_FRAMEWORK FIRST)

set (CMAKE_SYSTEM_FRAMEWORK_PATH
	${IOS_SDK_ROOT}/System/Library/Frameworks
	${IOS_SDK_ROOT}/Developer/Library/Frameworks
	${IOS_SDK_ROOT}/System/Library/PrivateFrameworks
	)

# Find the root
set(CMAKE_FIND_ROOT_PATH
	${IOS_DEVELOPER_ROOT}
	${IOS_SDK_ROOT}
	)

# Apparently this isn't need/doesn't work for Xcode generation
if(XCODE)
	set(CMAKE_CXX_COMPILER_WORKS TRUE)
	set(CMAKE_C_COMPILER_WORKS TRUE)
endif()


# only search the iOS stuff. No need to look through everything
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM only)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
