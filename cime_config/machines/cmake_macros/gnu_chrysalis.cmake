if (COMP_NAME STREQUAL gptl)
  string(APPEND CPPDEFS " -DHAVE_NANOTIME -DBIT64 -DHAVE_SLASHPROC -DHAVE_GETTIMEOFDAY")
endif()
set(PIO_FILESYSTEM_HINTS "gpfs")
execute_process(COMMAND $ENV{NETCDF_FORTRAN_PATH}/bin/nf-config --flibs OUTPUT_VARIABLE SHELL_CMD_OUTPUT_BUILD_INTERNAL_IGNORE0 OUTPUT_STRIP_TRAILING_WHITESPACE)
execute_process(COMMAND $ENV{NETCDF_C_PATH}/bin/nc-config --libs OUTPUT_VARIABLE SHELL_CMD_OUTPUT_BUILD_INTERNAL_IGNORE1 OUTPUT_STRIP_TRAILING_WHITESPACE)
string(APPEND SLIBS " ${SHELL_CMD_OUTPUT_BUILD_INTERNAL_IGNORE0} ${SHELL_CMD_OUTPUT_BUILD_INTERNAL_IGNORE1}")
string(APPEND SLIBS " -Wl,--start-group $ENV{MKLROOT}/lib/intel64/libmkl_gf_lp64.a $ENV{MKLROOT}/lib/intel64/libmkl_sequential.a $ENV{MKLROOT}/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm -ldl")
set(CXX_LIBS "-lstdc++")
set(NETCDF_C_PATH "$ENV{NETCDF_C_PATH}")
set(NETCDF_FORTRAN_PATH "$ENV{NETCDF_FORTRAN_PATH}")
set(PNETCDF_PATH "$ENV{PNETCDF_PATH}")
