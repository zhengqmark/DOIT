#!/bin/bash

for exp in pd18e; do
for r   in 1 2 3 4 5 6 7; do

std="--experiment $exp --iterations 1 \
--overcommit enable --tag rc66-hsw-try1 --tests deltafs --skipreads \
--extraopts '--cpu-bind=none' \
--env XX_IGNORE_DIRS=fields:hydro:rundata:names \
--env XX_SKIP_SAMP=1 \
--env XX_SKIP_PAPI=1 \
--env XX_NO_PRE_FLUSH=0 \
--env XX_NO_PRE_FLUSH_WAIT=0 \
--env XX_NO_PRE_FLUSH_SYNC=0 \
--env XX_BG_PAUSE=1 \
--env XX_BG_DEPTH=4 \
--env XX_SH_THREE_HOP=0 \
--env XX_HG_PROTO=ofi+gni \
--env XX_ALWAYS_SHUFFLE=0 \
--env XX_RPC_RANDOM_FLUSH=1 \
--env XX_RPC_BUF=$((16*1000)) \
--env XX_RPC_DEPTH=4 \
--env XX_RECV_RADIX=0 \
--env XX_BYPASS_CH=1  \
--env XX_BYPASS_WRITE=1 \
--env XX_PARTICLE_ID_SIZE=8 \
--env XX_PARTICLE_SIZE=56 \
--env XX_USE_PLAINDB=1 \
--env XX_MEMTABLE_SIZE=16MiB \
--env XX_BF_BITS=13 \
--env XX_IMD_RATELIMIT=0 \
--env XX_IMD_DROPDATA=1 \
--env 'VPIC_EMU_OPTS=-t 7200' \
--env 'VPIC_EMU=preload-runner' \
--env 'VPIC_PRE='"

eval ../vpicexpt_gen.pl ${std} --run $r --dw off .

done
done

exit 0
