transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Code/Verilog/VGA_test {D:/Code/Verilog/VGA_test/lcd_rgb_colorbar.v}
vlog -vlog01compat -work work +incdir+D:/Code/Verilog/VGA_test {D:/Code/Verilog/VGA_test/lcd_driver.v}
vlog -vlog01compat -work work +incdir+D:/Code/Verilog/VGA_test {D:/Code/Verilog/VGA_test/lcd_display.v}
vlog -vlog01compat -work work +incdir+D:/Code/Verilog/VGA_test {D:/Code/Verilog/VGA_test/lcd_pll.v}
vlog -vlog01compat -work work +incdir+D:/Code/Verilog/VGA_test/db {D:/Code/Verilog/VGA_test/db/lcd_pll_altpll.v}

