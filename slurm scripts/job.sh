#!/bin/bash

#SBATCH -J seissol-proxy
#SBATCH -o ./%x.%j.%N.out
#SBATCH -D ./
#SBATCH --get-user-env
#SBATCH --clusters=cm2_tiny
#SBATCH --partition=cm2_tiny
#SBATCH --nodes=1-1
#SBATCH --cpus-per-task=28
#SBATCH --export=NONE
#SBATCH --time=00:05:00

module load slurm_setup
module load python/3.8.11-extended
module load intel-oneapi-compilers/2021.4.0
module load intel-oneapi-mpi/2021.4.0-intel
module load intel-oneapi-vtune/2021.7.1
module load likwid/5.2.2-intel21

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# likwid-topology

# likwid-bench -t peakflops -W N:896kB:28:1:2
# likwid-bench -t peakflops_sp -W N:896kB:28:1:2
# likwid-bench -t peakflops_sse -W N:896kB:28:1:2
# likwid-bench -t peakflops_avx -W N:896kB:28:1:2
# likwid-bench -t peakflops_avx_fma -W N:896kB:28:1:2

# likwid-bench -t stream_mem_avx_fma -W N:2GB:28:1:2
# likwid-bench -t stream_avx_fma -W N:2GB:28:1:2
# likwid-bench -t stream -W N:2GB:28:1:2
# likwid-bench -t stream_sp -W N:2GB:28:1:2
# likwid-bench -t load -W N:2GB:28:1:2
# likwid-bench -t copy -W N:2GB:28:1:2

# ./SeisSol_proxy_Release_dhsw_4_elastic 1000000 100 all

likwid-perfctr -C 0-27 -g MEM ./SeisSol_proxy_Release_dhsw_4_elastic 10000 100 all
# likwid-perfctr -C 0-27 -g CACHES ./SeisSol_proxy_Release_dhsw_4_elastic 10000 100 all
# likwid-perfctr -C 0-27 -g FALSE_SHARE ./SeisSol_proxy_Release_dhsw_4_elastic 10000 100 all
# likwid-perfctr -C 0-27 -g L2CACHE ./SeisSol_proxy_Release_dhsw_4_elastic 10000 100 all
# likwid-perfctr -C 0-27 -g L3CACHE ./SeisSol_proxy_Release_dhsw_4_elastic 10000 100 all

# export KMP_AFFINITY=granularity=thread,compact,1,0
# vtune -collect memory-access -call-stack-mode user-plus-one -result-dir VtuneData/MemoryAccess -app-working-dir . ./SeisSol_proxy_Release_dhsw_4_elastic 1000000 100 all
# vtune -collect uarch-exploration -call-stack-mode user-plus-one -result-dir VtuneData/MicroArchitecture -app-working-dir . ./SeisSol_proxy_Release_dhsw_4_elastic 1000000 100 all
# vtune -collect hotspots -call-stack-mode user-plus-one -result-dir VtuneData/Hotspots -app-working-dir . ./SeisSol_proxy_Release_dhsw_4_elastic 1000000 100 all
# vtune -collect performance-snapshot -call-stack-mode user-plus-one -result-dir VtuneData/PerformanceSnapshot -app-working-dir . ./SeisSol_proxy_Release_dhsw_4_elastic 1000000 100 all
