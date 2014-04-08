export LIBS="-lhdf5_hl -lhdf5 -lz -lcurl"

./configure \
    --prefix=$NETCDF4_ROOT \
	--disable-shared \
    --enable-udunits \
    --with-pic \
    --with-libcf \
	--disable-cxx \
    --disable-dap | tee ${APP}.${COMP}.config

#    --enable-fortran \

make clean 2>&1 | tee ${APP}.${COMP}.clean
make 2>&1 | tee ${APP}.${COMP}.make
make check 2>&1 | tee ${APP}.${COMP}.check
make install 2>&1 | tee ${APP}.${COMP}.install
