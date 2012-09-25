macro(qt_find_modules)
    foreach(module ${ARGN})
        find_package(Qt5${module})
    endforeach()
endmacro()

macro(qt_use_modules target)
    qt5_use_modules(${target} ${ARGN})
endmacro()

macro(qt_generate_moc outfiles infiles)
    qt_generate_moc_plus(${outfiles} ${infiles} "" .moc)
endmacro()

function(qt_generate_moc_plus outfiles infiles prefix suffix)
    foreach(src ${${infiles}})
        get_filename_component(nameWithoutExtension ${src} NAME_WE)
        set(mocName ${prefix}${nameWithoutExtension}${suffix})
        qt5_generate_moc(${src} ${mocName})
        list(APPEND result ${mocName})
    endforeach()
    set(${outfiles} ${${outfiles}} ${result} PARENT_SCOPE)
    set_source_files_properties(${result} PROPERTIES
        HEADER_FILE_ONLY ON
    )
endfunction()

macro(qt_wrap_cpp outfiles)
    qt5_wrap_cpp(${outfiles} ${ARGN})
endmacro()

macro(qt_wrap_ui outfiles)
    qt5_wrap_ui(${outfiles} ${ARGN})
endmacro()

macro(qt_add_resources outfiles)
    qt5_add_resources(${outfiles} ${ARGN})
endmacro()

function(qt_trace_moc_files)
    if(NOT ARGN)
        set(ARGN *)
    endif()
    foreach(ext ${ARGN})
        file(GLOB_RECURSE files ${CMAKE_CURRENT_SOURCE_DIR}/*.${ext})
        list(SORT files)
        foreach(f ${files})
            file(STRINGS ${f} content REGEX "Q_OBJECT")
            if(content)
                file(RELATIVE_PATH result ${CMAKE_CURRENT_SOURCE_DIR} ${f})
                message("    ${result}")
            endif()
        endforeach()
    endforeach()
endfunction()
