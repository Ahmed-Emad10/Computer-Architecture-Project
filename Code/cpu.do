vsim -gui work.cpu
add wave -position insertpoint  \
sim:/cpu/en \
sim:/cpu/clk \
sim:/cpu/rst \
sim:/cpu/AluSrc \
sim:/cpu/en1 \
sim:/cpu/rst1 \
sim:/cpu/rstm \
sim:/cpu/wr \
sim:/cpu/ccr \
sim:/cpu/rdst \
sim:/cpu/regDestOut \
sim:/cpu/aluOp \
sim:/cpu/pc \
sim:/cpu/inst \
sim:/cpu/r1 \
sim:/cpu/result \
sim:/cpu/alures \
sim:/cpu/aluout
force -freeze sim:/cpu/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/cpu/rst 111 0
force -freeze sim:/cpu/en 010 0
force -freeze sim:/cpu/en1 1 0
force -freeze sim:/cpu/rst1 1 0
force -freeze sim:/cpu/rstm 1 0
force -freeze sim:/cpu/inportSignal 00 0
mem load -filltype value -filldata {0010000100000000  } -fillradix symbolic /cpu/ftch/IM/ram(7)
mem load -filltype value -filldata {0010000100000000  } -fillradix symbolic /cpu/ftch/IM/ram(6)
mem load -filltype value -filldata {0010000100000000  } -fillradix symbolic /cpu/ftch/IM/ram(8)
mem load -filltype value -filldata {0010000100000000  } -fillradix symbolic /cpu/ftch/IM/ram(9)
mem load -filltype value -filldata {0010000100000000  } -fillradix symbolic /cpu/ftch/IM/ram(10)
mem load -filltype value -filldata 0010000100000000 -fillradix symbolic /cpu/ftch/IM/ram(0)
mem load -filltype value -filldata 0010000100000000  -fillradix symbolic /cpu/ftch/IM/ram(1)
mem load -filltype value -filldata 0010000100000000 -fillradix symbolic /cpu/ftch/IM/ram(2)
mem load -filltype value -filldata 0010000100000000  -fillradix symbolic /cpu/ftch/IM/ram(3)
mem load -filltype value -filldata 0010000100000000 -fillradix symbolic /cpu/ftch/IM/ram(4)
mem load -filltype value -filldata 0010000100000000  -fillradix symbolic /cpu/ftch/IM/ram(5)
run
force -freeze sim:/cpu/en 101 0
force -freeze sim:/cpu/rst 000 0
force -freeze sim:/cpu/rst1 0 0
force -freeze sim:/cpu/rstm 0 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ftch/IM
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ftch/IM
run

#run
#run
#run
#run
#run
#run
#run
#run
# ** 
