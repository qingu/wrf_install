FILE=configure.wrf
#sed -i 's/-ffixed-form/-ffixed-form -cpp/g' $FILE
#sed -i 's/-ffree-form/-ffree-form -cpp/g' $FILE
sed -i 's/^FORMAT_F.*[ \t]*=.*/& -cpp/g' $FILE
sed -i 's/-lnetcdff -lnetcdf/-lnetcdff -lnetcdf -lhdf5_hl -lhdf5 -lz -lm/g' $FILE
#set -i 's/netcdff[ \t]*-lnetcdf/& -lhdf5_hl -lhdf5 -lz -lm/g' $FILE
