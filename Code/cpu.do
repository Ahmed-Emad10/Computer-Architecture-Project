vsim -gui work.cpu
# vsim -gui work.cpu 
# Start time: 19:45:21 on Jan 09,2022
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.cpu(cpu)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading work.forwardunit(forwardunit)
# Loading work.hazarddetection(hazarddetection)
# Loading work.fetchstage(myfetchstage)
# Loading work.pc(mypc)
# Loading work.reg(reg)
# Loading ieee.numeric_std(body)
# Loading work.instructionmemory(myinstructionmemory)
# Loading work.instructionsize(instructionsize1)
# Loading work.nbitadder(nbitarch)
# Loading work.onebitadder(onebitarch)
# Loading work.mux2x1(mymux2x1)
# Loading work.mux(mux)
# Loading work.fetchbuffer(myfetchbuffer)
# Loading work.jmpdetection(myjmpdetection)
# Loading work.decode(decode)
# Loading work.contunit(contunit)
# Loading work.regfile(regfile)
# Loading work.decoder8(dd)
# Loading work.id_ex(id_ex)
# Loading work.reg_ris(reg_ris)
# ** Warning: (vsim-3473) Component instance "u3 : reg1bit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /cpu/decodeBuffer File: F:/Computer Architecture/Project/Computer-Architecture-Project/Code/id_ex.vhd
# ** Warning: (vsim-3473) Component instance "u4 : reg1bit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /cpu/decodeBuffer File: F:/Computer Architecture/Project/Computer-Architecture-Project/Code/id_ex.vhd
# ** Warning: (vsim-3473) Component instance "u6 : reg1bit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /cpu/decodeBuffer File: F:/Computer Architecture/Project/Computer-Architecture-Project/Code/id_ex.vhd
# ** Warning: (vsim-3473) Component instance "u7 : reg1bit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /cpu/decodeBuffer File: F:/Computer Architecture/Project/Computer-Architecture-Project/Code/id_ex.vhd
# ** Warning: (vsim-3473) Component instance "u8 : reg1bit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /cpu/decodeBuffer File: F:/Computer Architecture/Project/Computer-Architecture-Project/Code/id_ex.vhd
# ** Warning: (vsim-3473) Component instance "u9 : reg1bit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /cpu/decodeBuffer File: F:/Computer Architecture/Project/Computer-Architecture-Project/Code/id_ex.vhd
# ** Warning: (vsim-3473) Component instance "u10 : reg1bit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /cpu/decodeBuffer File: F:/Computer Architecture/Project/Computer-Architecture-Project/Code/id_ex.vhd
# ** Warning: (vsim-3473) Component instance "u11 : reg1bit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /cpu/decodeBuffer File: F:/Computer Architecture/Project/Computer-Architecture-Project/Code/id_ex.vhd
# ** Warning: (vsim-3473) Component instance "u12 : reg1bit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /cpu/decodeBuffer File: F:/Computer Architecture/Project/Computer-Architecture-Project/Code/id_ex.vhd
# ** Warning: (vsim-3473) Component instance "u21 : reg1bit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /cpu/decodeBuffer File: F:/Computer Architecture/Project/Computer-Architecture-Project/Code/id_ex.vhd
# ** Warning: (vsim-3473) Component instance "u22 : reg1bit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /cpu/decodeBuffer File: F:/Computer Architecture/Project/Computer-Architecture-Project/Code/id_ex.vhd
# Loading work.exstage(exstage)
# Loading ieee.std_logic_signed(body)
# Loading work.alu(alu)
# Loading work.memstage(mymemstage)
# Loading work.datamemory(mydatamemory)
# Loading work.membuffer(mymembuffer)
# Loading work.writeback(writeback)
# ** Warning: (vsim-3473) Component instance "pop0 : popException" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /cpu File: F:/Computer Architecture/Project/Computer-Architecture-Project/Code/cpu.vhd
# Loading work.invalidaddress(invalidaddress)
# ** Warning: (vsim-8684) No drivers exist on out port /cpu/decodeBuffer/outPort, and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /cpu/outPortflag_out.
# ** Warning: (vsim-8684) No drivers exist on out port /cpu/decodeBuffer/AluSrc, and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /cpu/AluSrc_out.
# ** Warning: (vsim-8684) No drivers exist on out port /cpu/decodeBuffer/memWrite, and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /cpu/memWrite_out.
# ** Warning: (vsim-8684) No drivers exist on out port /cpu/decodeBuffer/memRead, and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /cpu/memRead_out.
# ** Warning: (vsim-8684) No drivers exist on out port /cpu/decodeBuffer/pop, and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /cpu/pop_out.
# ** Warning: (vsim-8684) No drivers exist on out port /cpu/decodeBuffer/push, and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /cpu/push_out.
# ** Warning: (vsim-8684) No drivers exist on out port /cpu/decodeBuffer/ret, and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /cpu/ret_out.
# ** Warning: (vsim-8684) No drivers exist on out port /cpu/decodeBuffer/int, and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /cpu/int_out.
# ** Warning: (vsim-8684) No drivers exist on out port /cpu/decodeBuffer/instSize, and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /cpu/instSize_out.
# ** Warning: (vsim-8684) No drivers exist on out port /cpu/decodeBuffer/call, and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /cpu/call_out.
# ** Warning: (vsim-8684) No drivers exist on out port /cpu/decodeBuffer/RTI, and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /cpu/rti_out.
# ** Warning: (vsim-8683) Uninitialized inout port /cpu/invalidAdd/invalidAdd has no driver.
# This port will contribute value (U) to the signal network.
mem load -i {D:/oneOperand (2).mem} /cpu/ftch/IM/ram
add wave -position insertpoint  \
sim:/cpu/en \
sim:/cpu/clk \
sim:/cpu/Reset \
sim:/cpu/start \
sim:/cpu/rst \
sim:/cpu/startAdd \
sim:/cpu/inport \
sim:/cpu/Address \
sim:/cpu/instMemData \
sim:/cpu/memPC \
sim:/cpu/outport
# ** Warning: (vsim-WLF-5000) WLF file currently in use: vsim.wlf
#           File in use by: ahmed  Hostname: AHMED-PC  ProcessID: 11584
#           Attempting to use alternate WLF file "./wlft4ysbh8".
# ** Warning: (vsim-WLF-5001) Could not open WLF file: vsim.wlf
#           Using alternate file: ./wlft4ysbh8
add wave -position insertpoint  \
sim:/cpu/epc \
sim:/cpu/PCfMEM
add wave -position insertpoint  \
sim:/cpu/ccr
add wave -position insertpoint sim:/cpu/dec/rf1/R0/*
add wave -position insertpoint sim:/cpu/dec/rf1/R1/*
add wave -position insertpoint sim:/cpu/dec/rf1/R2/*
add wave -position insertpoint sim:/cpu/dec/rf1/R3/*
add wave -position insertpoint sim:/cpu/dec/rf1/R4/*
add wave -position insertpoint sim:/cpu/dec/rf1/R5/*
add wave -position insertpoint sim:/cpu/dec/rf1/R6/*
add wave -position insertpoint sim:/cpu/dec/rf1/R7/*
force -freeze sim:/cpu/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/cpu/Reset 1 0
force -freeze sim:/cpu/PCfMEM x\"a00\" 0
force -freeze sim:/cpu/PCfMEM x\"a0\" 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /cpu/mem
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ex/alu0
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ftch/IM
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /cpu/ftch/IM
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 2  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 2  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 4  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 4  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 4  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 4  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 4  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 4  Instance: /cpu/f
run
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 3  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 19  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 19  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 19  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 19  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 19  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 20  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 20  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 20  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 20  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 20  Instance: /cpu/ex/alu0
force -freeze sim:/cpu/Reset 0 0
force -freeze sim:/cpu/en 101 0
run
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 21  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 21  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 21  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 21  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 21  Instance: /cpu/ex/alu0
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 150 ps  Iteration: 1  Instance: /cpu/mem
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 150 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 150 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 150 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 150 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 150 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 150 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 150 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 150 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 150 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 150 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 200 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 200 ps  Iteration: 1  Instance: /cpu/f
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 200 ps  Iteration: 1  Instance: /cpu/f
add wave -position insertpoint  \
sim:/cpu/ftch/PCOut
run
run
force -freeze sim:/cpu/rst 111 0
run
force -freeze sim:/cpu/rst 00 0
# Value length (2) does not equal array index length (3).
# ** UI-Msg: (vsim-4011) Invalid force value: 00 0.
# 
force -freeze sim:/cpu/rst 000 0
run
force -freeze sim:/cpu/en 100 0
force -freeze sim:/cpu/Reset 1 0
run
force -freeze sim:/cpu/en 101 0
force -freeze sim:/cpu/Reset 0 0
run

# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 800 ps  Iteration: 2  Instance: /cpu/mem
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 900 ps  Iteration: 2  Instance: /cpu/mem
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 950 ps  Iteration: 1  Instance: /cpu/mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1 ns  Iteration: 2  Instance: /cpu/mem
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1050 ps  Iteration: 1  Instance: /cpu/mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1100 ps  Iteration: 2  Instance: /cpu/mem

run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1150 ps  Iteration: 1  Instance: /cpu/mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1200 ps  Iteration: 2  Instance: /cpu/mem
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1250 ps  Iteration: 1  Instance: /cpu/mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1300 ps  Iteration: 2  Instance: /cpu/mem
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1350 ps  Iteration: 1  Instance: /cpu/mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1400 ps  Iteration: 2  Instance: /cpu/mem
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1450 ps  Iteration: 1  Instance: /cpu/mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1500 ps  Iteration: 2  Instance: /cpu/mem
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1550 ps  Iteration: 1  Instance: /cpu/mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1600 ps  Iteration: 2  Instance: /cpu/mem
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 1600 ps  Iteration: 5  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 1600 ps  Iteration: 5  Instance: /cpu/ex/alu0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1650 ps  Iteration: 1  Instance: /cpu/mem
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 1700 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 1700 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1700 ps  Iteration: 2  Instance: /cpu/mem
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1750 ps  Iteration: 1  Instance: /cpu/mem
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 1800 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 1800 ps  Iteration: 1  Instance: /cpu/ex/alu0
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 1800 ps  Iteration: 2  Instance: /cpu/ex/alu0
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 1800 ps  Iteration: 2  Instance: /cpu/mem
run