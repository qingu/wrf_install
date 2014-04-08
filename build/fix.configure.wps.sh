FILE=configure.wps

# hdf5
#perl -i -pe "s!-lnetcdff!-lnetcdff -L${WRF_BASE}/${dep_root}/lib -lhdf5_hl -lhdf5 !g" $FILE
NETCDFOPT=$(echo $($NETCDF/bin/nc-config --flibs) | sed 's#\/#\\\/#g') 
sed -i "s/-lnetcdff[ \t]*-lnetcdf/ $NETCDFOPT/g" $FILE

# configure.wps doesn't contain compression libs and compression include
# COMPRESSION_LIBS	= -L$(JASPERLIB)  -ljasper -lpng -lz
# COMPRESSION_INC		= -I$(JASPERINC) \
#                        -I$(JASPERINC)/jasper

#perl -i -pe "s!(^COMPRESSION_LIBS.*)!\$1 -L\\$\(JASPERLIB\)  -ljasper -lpng -lz!" $FILE
#perl -i -pe "s!(^COMPRESSION_INC.*)!\$1 -I\\$\(JASPERINC\) -I\\$\(JASPERINC\)/jasper!" $FILE

COMP_LIBS=$(echo $JASPERLIB|sed 's#\/#\\\/#g')
COMP_INC=$(echo $JASPERINC|sed 's#\/#\\\/#g')

sed -i "s/^COMPRESSION_LIBS[ \t]*= /& -L$COMP_LIBS -ljasper -lpng -lz /g" $FILE 
sed -i "s/^COMPRESSION_INC[ \t]*= /& -I\/$COMP_INC -I\/$COMP_INC\/jasper/g" $FILE 


# -cpp
#sed -i 's/-ffree-form/& -cpp/g' $FILE
#sed -i 's/-ffixed-form/& -cpp/g' $FILE
sed -i 's/^FFLAGS.*/& -cpp/g' $FILE
sed -i 's/^F77FLAGS.*/& -cpp/g' $FILE
