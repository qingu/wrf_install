FILE=configure.wrf
#perl -i -pe "s!(^[ \t]*-L.*)!\$1 -L${WRF_BASE}/${dep_root}/lib -lhdf5_hl -lhdf5 -lz -lm!" $FILE
#sed -i 's/-lnetcdff -lnetcdf/-lnetcdff -lnetcdf -lhdf5_hl -lhdf -lz -lm' $FILE
