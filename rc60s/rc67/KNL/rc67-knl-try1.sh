#!/bin/bash

for exp in pd18e; do
for r   in 6 7; do

std="--partition knl --constraints knl,quad,flat --experiment $exp --iterations 1 \
--overcommit enable --tag rc67-knl-try1 --tests deltafs --skipreads \
--cpubind=none --extraopts '--mem-bind=map_mem:0x0' \
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
--env XX_RPC_BUF=$((64*1000)) \
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
