cp fibo.img riscv-proc/tb/imem_init.img
cp fibo.img riscv-proc/tb/dmem_data_init.img
cd riscv-proc
./ghdl_compile.sh
./ghdl_simulate.sh -r 500000