--[[
	Research sources 
	- https://github.com/AminAliari/assimp
	- https://github.com/premake/premake-core/issues/1533
]]-- 

-- How to use:
-- 0. Get assimp from https://github.com/assimp/assimp
-- 1. Place this file next to the cloned assimp repository like this:
--
--       assimp.lua
--       assimp/
--
-- 2. Set up configuration headers
--
--     2.1 Create a folder for configuration headers, I usually name it _config_headers/
--
--          _config_headers/assimp/     <- config.h will be included as "assimp/config.h" so the assimp/ part is important
--          assimp.lua
--          assimp
--
--     2.2 Generate config.h and revision.h from assimp/code/config.h.in and assimp/revision.h.in and put them into _config_headers/assimp. (You can also just edit and rename them, that's what I usually end up doing.)
--
--          _config_headers/
--            assimp/
--              config.h
--              revision.h
--          assimp.lua
--          assimp
--
-- 3. Edit the 'files { ... }' and 'defines { ... }' depending on which importers/exporters you need. By default I enabled COLLADA, OBJ, FBX and ASSBIN (assimp binary, good for caching)

project '*'
	includedirs {
		'_config_headers/',
		'_config_headers/assimp/', -- Location of assimp's config.h, for a template see include/assimp/config.h.in
		'assimp/include/',
	}
project 'assimp'
	--kind 'SharedLib'
	kind 'StaticLib'
	warnings 'Off'
	optimize 'Speed'

    language "C++"
    cppdialect "C++17"
    
	targetdir(bin_dir)
    objdir(int_dir)
	
	includedirs {
		'_config_headers/',				
		'include/',
		'code/',
		'contrib/',
		'contrib/zlib/',
		"contrib/pugixml/src/",
		"contrib/unzip/",
		"contrib/openddlparser/include/",
		"%{prj.location}"		
	}
	files {
		"code/AssetLib/**.h",
		"code/AssetLib/**.cpp",
		"code/AssetLib/**.hpp",

		"code/CApi/**.h",
		"code/CApi/**.hpp",
		"code/CApi/**.cpp",

		"code/Common/**.h",
		"code/Common/**.hpp",
		"code/Common/**.cpp",

		"code/Geometry/**.hpp",
		"code/Geometry/**.cpp",
		"code/Geometry/**.h",

		"code/Material/**.hpp",
		"code/Material/**.cpp",
		"code/Material/**.h",

		"code/Pbrt/**.hpp",
		"code/Pbrt/**.cpp",
		"code/Pbrt/**.h",

		"code/PostProcessing/**.hpp",
		"code/PostProcessing/**.cpp",
		"code/PostProcessing/**.h",

		"include/assimp/compiler/**.h",
		
		"contrib/clipper/*.cpp",
		"contrib/clipper/*.hpp",
		
		"contrib/Open3DGC/*.hpp",
		"contrib/Open3DGC/*.h",
		"contrib/Open3DGC/*.cpp",
		"contrib/Open3DGC/*.inl",
		
		"contrib/openddlparser/code/*.cpp",
		"contrib/openddlparser/include/openddlparser/*.h",
		
		"contrib/poly2try/poly2tri/**.h",
		"contrib/poly2try/poly2tri/**.cc",
		
		"contrib/pugixml/src/**.hpp",
		"contrib/pugixml/src/**.cpp",
		
		"contrib/stb/*.h",
		
		"contrib/unzip/*.h",
		"contrib/unzip/*.c",
		
		"contrib/zip/src/*.c",
		"contrib/zip/src/*.h",

		"contrib/zlib/*.c",
		"contrib/zlib/*.h",
		
		"include/assimp/*.h",
		"include/assimp/*.hpp",
		"include/assimp/*.inl",

		--"code/res/*.rc" -- windows resouce file
	}
	-- Importers
	defines {
	
	--'ASSIMP_BUILD_NO_OWN_ZLIB', -- this causes and error if excluded.
		'OPENDDL_STATIC_LIBARY',
		'ASSIMP_BUILD_NO_3D_IMPORTER',
		'ASSIMP_BUILD_NO_3DS_IMPORTER',
		'ASSIMP_BUILD_NO_3MF_IMPORTER',
		'ASSIMP_BUILD_NO_AC_IMPORTER',
		'ASSIMP_BUILD_NO_AMF_IMPORTER',
		'ASSIMP_BUILD_NO_ASE_IMPORTER',
		-- 'ASSIMP_BUILD_NO_ASSBIN_IMPORTER'
		'ASSIMP_BUILD_NO_B3D_IMPORTER',
		'ASSIMP_BUILD_NO_BLEND_IMPORTER',
		'ASSIMP_BUILD_NO_BVH_IMPORTER',
		'ASSIMP_BUILD_NO_C4D_IMPORTER',
		'ASSIMP_BUILD_NO_COB_IMPORTER',
		'ASSIMP_BUILD_NO_COLLADA_IMPORTER',
		'ASSIMP_BUILD_NO_CSM_IMPORTER',
		'ASSIMP_BUILD_NO_DXF_IMPORTER',
		-- 'ASSIMP_BUILD_NO_FBX_IMPORTER',
		'ASSIMP_BUILD_NO_GLTF_IMPORTER',
		'ASSIMP_BUILD_NO_HMP_IMPORTER',
		'ASSIMP_BUILD_NO_IFC_IMPORTER',
		'ASSIMP_BUILD_NO_IRR_IMPORTER',
		'ASSIMP_BUILD_NO_IRRMESH_IMPORTER',
		'ASSIMP_BUILD_NO_LWO_IMPORTER',
		'ASSIMP_BUILD_NO_LWS_IMPORTER',
		'ASSIMP_BUILD_NO_M3D_IMPORTER',
		'ASSIMP_BUILD_NO_MD2_IMPORTER',
		'ASSIMP_BUILD_NO_MD3_IMPORTER',
		'ASSIMP_BUILD_NO_MD5_IMPORTER',
		'ASSIMP_BUILD_NO_MDC_IMPORTER',
		'ASSIMP_BUILD_NO_MDL_IMPORTER',
		'ASSIMP_BUILD_NO_MMD_IMPORTER',
		'ASSIMP_BUILD_NO_MS3D_IMPORTER',
		'ASSIMP_BUILD_NO_NDO_IMPORTER',
		'ASSIMP_BUILD_NO_NFF_IMPORTER',
		-- 'ASSIMP_BUILD_NO_OBJ_IMPORTER',
		'ASSIMP_BUILD_NO_OFF_IMPORTER',
		'ASSIMP_BUILD_NO_OGRE_IMPORTER',
		'ASSIMP_BUILD_NO_OPENGEX_IMPORTER',
		'ASSIMP_BUILD_NO_PLY_IMPORTER',
		'ASSIMP_BUILD_NO_Q3BSP_IMPORTER',
		'ASSIMP_BUILD_NO_Q3D_IMPORTER',
		'ASSIMP_BUILD_NO_RAW_IMPORTER',
		'ASSIMP_BUILD_NO_SIB_IMPORTER',
		'ASSIMP_BUILD_NO_SMD_IMPORTER',
		'ASSIMP_BUILD_NO_STEP_IMPORTER',
		'ASSIMP_BUILD_NO_STL_IMPORTER',
		'ASSIMP_BUILD_NO_TERRAGEN_IMPORTER',
		'ASSIMP_BUILD_NO_X_IMPORTER',
		'ASSIMP_BUILD_NO_X3D_IMPORTER',
		'ASSIMP_BUILD_NO_XGL_IMPORTER'
	}
	-- Exporters
	defines {
		'ASSIMP_BUILD_NO_COLLADA_EXPORTER',
		'ASSIMP_BUILD_NO_X_EXPORTER',
		'ASSIMP_BUILD_NO_STEP_EXPORTER',
		--'ASSIMP_BUILD_NO_OBJ_EXPORTER',
		'ASSIMP_BUILD_NO_STL_EXPORTER',
		'ASSIMP_BUILD_NO_PLY_EXPORTER',
		'ASSIMP_BUILD_NO_3DS_EXPORTER',
		'ASSIMP_BUILD_NO_GLTF_EXPORTER',
		'ASSIMP_BUILD_NO_ASSBIN_EXPORTER',
		'ASSIMP_BUILD_NO_ASSXML_EXPORTER',
		'ASSIMP_BUILD_NO_X3D_EXPORTER',
		'ASSIMP_BUILD_NO_FBX_EXPORTER',
		'ASSIMP_BUILD_NO_M3D_EXPORTER',
		'ASSIMP_BUILD_NO_3MF_EXPORTER',
		'ASSIMP_BUILD_NO_ASSJSON_EXPORTER'
	}
		
	filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines "DEBUG"
        runtime "Debug"
        symbols "on"
    
    filter "configurations:Release"
        defines "NDEBUG"
        runtime "Release"
        optimize "on"