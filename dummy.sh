#usr/bin/env bash
cd build
make install
cd ..
wait

cooker recipes/midasconverter.xml run00$1.mid run$1.root
cooker recipes/Histos.xml run$1.root run$1\_cooked_plots.root -e 1000


root 'plots.cxx($1)'

