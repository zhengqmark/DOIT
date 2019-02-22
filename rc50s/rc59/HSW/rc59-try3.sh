#!/bin/bash

for exp in cs19b; do
for bw  in 2794455 3725940 4471128 5588910 7451880; do
for r   in 6; do

std="--experiment $exp --iterations 1 \
--overcommit enable --tag rc59-pdb-try3-$bw --tests deltafs --skipreads \
--extraopts '--cpu-bind=none' \
--env XX_IGNORE_DIRS=fields:hydro:rundata:names \
--env XX_SKIP_SAMP=0 \
--env XX_SKIP_PAPI=1 \
--env XX_NO_PRE_FLUSH=0 \
--env XX_NO_PRE_FLUSH_WAIT=0 \
--env XX_NO_PRE_FLUSH_SYNC=0 \
--env XX_BG_PAUSE=1 \
--env XX_BG_DEPTH=4 \
--env XX_SH_THREE_HOP=1 \
--env MPICH_GNI_NDREG_ENTRIES=1024 \
--env XX_HG_PROTO=ofi+gni \
--env XX_ALWAYS_SHUFFLE=1 \
--env XX_RPC_RANDOM_FLUSH=1 \
--env XX_RPC_BUF=$((16*1000)) \
--env XX_RPC_DEPTH=2 \
--env XX_RECV_RADIX=0 \
--env XX_BYPASS_CH=1  \
--env XX_BYPASS_WRITE=0 \
--env XX_PARTICLE_ID_SIZE=8 \
--env XX_PARTICLE_SIZE=56 \
--env XX_USE_PLAINDB=1 \
--env XX_FMT_WISC=1 \
--env XX_MEMTABLE_SIZE=16MiB \
--env XX_BF_BITS=13 \
--env XX_IMD_RATELIMIT=$(($bw*2)) \
--env XX_IMD_SERIALIO=1 \
--env 'VPIC_EMU_OPTS=-t 7200' \
--env 'VPIC_EMU=preload-runner' \
--env 'VPIC_PRE='"

eval ../vpicexpt_gen.pl ${std} --run $r --dw bw .

done
done
done

exit 0
