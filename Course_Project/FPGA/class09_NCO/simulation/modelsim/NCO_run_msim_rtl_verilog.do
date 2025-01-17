transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib nco_test
vmap nco_test nco_test
vlog -vlog01compat -work nco_test +incdir+C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/module/module/synthesis {C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/module/module/synthesis/nco_test.v}
vlog -vlog01compat -work nco_test +incdir+C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/module/module/synthesis/submodules {C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/module/module/synthesis/submodules/nco_test_nco_ii_0.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/module {C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/module/NCO.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/module {C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/module/tlv5618a_interface.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/module {C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/module/tlv5618a_device.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/module {C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/module/PLL.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/db {C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/db/pll_altpll.v}

vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/testbench {C:/Users/Administrator/Desktop/github_code/Planof2019_half/Course_Project/FPGA/class09_NCO/testbench/NCO_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -L nco_test -voptargs="+acc"  NCO_tb

add wave *
view structure
view signals
run -all
