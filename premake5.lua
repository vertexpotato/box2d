project "box2d"
    kind "StaticLib"
    language "C"
    staticruntime "off"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/**/**.cpp",
        "src/**/**.h",
    }

    includedirs
    {
        "src/",
        "include"
    }

    configuration "target-emscripten"
        buildoptions("-fPIC");
        linkoptions("-fPIC");
    
    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"