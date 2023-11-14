transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+W:/SDPROG/P2/Practica2 {W:/SDPROG/P2/Practica2/LCD_SYNC.v}
vlog -vlog01compat -work work +incdir+W:/SDPROG/P2/Practica2 {W:/SDPROG/P2/Practica2/contNb.v}
vlog -vlog01compat -work work +incdir+W:/SDPROG/P2/Practica2 {W:/SDPROG/P2/Practica2/pll_ltm.v}
vlog -vlog01compat -work work +incdir+W:/SDPROG/P2/Practica2 {W:/SDPROG/P2/Practica2/Direccionamiento.v}
vlog -vlog01compat -work work +incdir+W:/SDPROG/P2/Practica2 {W:/SDPROG/P2/Practica2/ROM_image.v}
vlog -vlog01compat -work work +incdir+W:/SDPROG/P2/Practica2 {W:/SDPROG/P2/Practica2/IMAGEN_LCD.v}
vlog -vlog01compat -work work +incdir+W:/SDPROG/P2/Practica2 {W:/SDPROG/P2/Practica2/datos_a_rgb.v}
vlog -vlog01compat -work work +incdir+W:/SDPROG/P2/Practica2/db {W:/SDPROG/P2/Practica2/db/pll_ltm_altpll.v}

vlog -vlog01compat -work work +incdir+W:/SDPROG/P2/Practica2 {W:/SDPROG/P2/Practica2/IMAGEN_LCD_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  IMAGEN_LCD_tb

add wave *
view structure
view signals
run -all
