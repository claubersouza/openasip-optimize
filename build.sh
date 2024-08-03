oacc-riscv -O3 -a start.adf --output-format=bin -o teste.img teste.c
rm -rf riscv-proc/
generateprocessor -o riscv-proc -t start.adf
generatebits -x riscv-proc start.adf
cp teste.img riscv-proc/tb/imem_init.img
cp teste.img riscv-proc/tb/dmem_data_init.img
cd riscv-proc
./ghdl_compile.sh
./ghdl_simulate.sh -r 100000
