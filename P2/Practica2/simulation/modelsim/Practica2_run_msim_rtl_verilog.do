transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/alber/Desktop/Universidad/Sistemas\ digitales\ programables/Practicas/P2/Practica2 {C:/Users/alber/Desktop/Universidad/Sistemas digitales programables/Practicas/P2/Practica2/LCD_SYNC.v}
vlog -vlog01compat -work work +incdir+C:/Users/alber/Desktop/Universidad/Sistemas\ digitales\ programables/Practicas/P2/Practica2 {C:/Users/alber/Desktop/Universidad/Sistemas digitales programables/Practicas/P2/Practica2/contNb.v}
vlog -vlog01compat -work work +incdir+C:/Users/alber/Desktop/Universidad/Sistemas\ digitales\ programables/Practicas/P2/Practica2 {C:/Users/alber/Desktop/Universidad/Sistemas digitales programables/Practicas/P2/Practica2/pll_ltm.v}
vlog -vlog01compat -work work +incdir+C:/Users/alber/Desktop/Universidad/Sistemas\ digitales\ programables/Practicas/P2/Practica2 {C:/Users/alber/Desktop/Universidad/Sistemas digitales programables/Practicas/P2/Practica2/barras_rgb.v}
vlog -vlog01compat -work work +incdir+C:/Users/alber/Desktop/Universidad/Sistemas\ digitales\ programables/Practicas/P2/Practica2 {C:/Users/alber/Desktop/Universidad/Sistemas digitales programables/Practicas/P2/Practica2/barras_lcd.v}
vlog -vlog01compat -work work +incdir+C:/Users/alber/Desktop/Universidad/Sistemas\ digitales\ programables/Practicas/P2/Practica2/db {C:/Users/alber/Desktop/Universidad/Sistemas digitales programables/Practicas/P2/Practica2/db/pll_ltm_altpll.v}

vlog -vlog01compat -work work +incdir+C:/Users/alber/Desktop/Universidad/Sistemas\ digitales\ programables/Practicas/P2/Practica2 {C:/Users/alber/Desktop/Universidad/Sistemas digitales programables/Practicas/P2/Practica2/barras_lcd_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  barras_lcd_tb

add wave *
view structure
view signals
run -all
