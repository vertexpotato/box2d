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
        if _OPTIONS['em-debug'] then
            buildoptions{"-fPIC -pthread", "-s NO_DISABLE_EXCEPTION_CATCHING", "--profiling"};
            linkoptions{"-fPIC -pthread", "-s NO_DISABLE_EXCEPTION_CATCHING", "--profiling"};
	    else
            buildoptions{"-fPIC -pthread -O3"};
            linkoptions{"-fPIC -pthread -O3"};
	    end
    
    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"