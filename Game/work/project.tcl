set projDir "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/planAhead"
set projName "Game"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/mojo_top_0.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/alu_1.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/alu_1.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/dual_seven_seg_2_3.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/dual_seven_seg_2_3.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/fsm_5.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/fsm_5.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/regfiles_7.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/reset_conditioner_8.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/edge_detector_9.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/button_conditioner_10.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/edge_detector_9.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/button_conditioner_10.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/edge_detector_9.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/button_conditioner_10.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/edge_detector_9.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/button_conditioner_10.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/adder_16bit_17.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/boolean_16bit_18.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/shifter_16bit_19.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/compare16bit_20.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/multiply_16bit_21.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/adder_16bit_17.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/boolean_16bit_18.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/shifter_16bit_19.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/compare16bit_20.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/multiply_16bit_21.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/random_problem_27.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/random_problem_27.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/pipeline_29.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/pipeline_29.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/pipeline_29.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/pipeline_29.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/adder_16bit_1_33.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/adder_16bit_2_34.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/adder_16bit_1_33.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/adder_16bit_2_34.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/pn_gen_37.v" "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/work/verilog/pn_gen_37.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/Matthew/Documents/GitHub/MOJO-game/Game/constraint/pins.ucf" "D:/SUTD/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
