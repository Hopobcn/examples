newoption {
    trigger = "to",
    value   = "path",
    description = "Set the output location for the generated files"
}

local src_dir = "."
local build_dir = _OPTIONS["to"] or "."

local conan_include_dir = (path.join(build_dir, "conanbuildinfo.premake.lua"))
include (conan_include_dir)

workspace("md5")
    location (build_dir)
    conan_basic_setup()

    project "md5"
        kind "ConsoleApp"
        language "C++"
        targetdir (path.join(build_dir, "bin/%{cfg.buildcfg}"))
        objdir (path.join(build_dir, "obj"))

        linkoptions { conan_exelinkflags }

        files { path.join(src_dir, "**.h"), path.join(src_dir, "**.cpp") }

        filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

        filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
