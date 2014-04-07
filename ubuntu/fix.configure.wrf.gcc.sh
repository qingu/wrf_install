set -x
FILE=configure.wrf
NETCDFOPT=$(echo $($NETCDF/bin/nc-config --flibs) | sed 's#\/#\\\/#g')
echo hello $NETCDFOPT
#sed -i 's/-ffixed-form/-ffixed-form -cpp/g' $FILE
#sed -i 's/-ffree-form/-ffree-form -cpp/g' $FILE
sed -i 's/^FORMAT_F.*[ \t]*=.*/& -cpp/g' $FILE
#sed -i 's/-lnetcdff -lnetcdf/-lnetcdff -lnetcdf -lhdf5_hl -lhdf5 -lz -lm/g' $FILE
sed -i "s/-lnetcdff[ \t]*-lnetcdf/ $NETCDFOPT/g" $FILE
sed -i "s/-lnetcdf$/ $NETCDFOPT/g" ./external/io_netcdf/makefile
