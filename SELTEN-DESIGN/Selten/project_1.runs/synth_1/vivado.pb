
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:002

00:00:062	
513.3982	
201.375Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/nirma/OneDrive/Documents/SELTEN-DESIGN/project_1/project_1.srcs/utils_1/imports/synth_1/CPU.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2j
hC:/Users/nirma/OneDrive/Documents/SELTEN-DESIGN/project_1/project_1.srcs/utils_1/imports/synth_1/CPU.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
^
Command: %s
53*	vivadotcl2-
+synth_design -top CPU -part xc7z020clg484-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7z020Z17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7z020Z17-349h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
62684Z8-7075h px� 
�
%s*synth2u
sStarting Synthesize : Time (s): cpu = 00:00:04 ; elapsed = 00:00:09 . Memory (MB): peak = 979.578 ; gain = 449.441
h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
clk2
wire2=
9C:/Users/nirma/OneDrive/Documents/AA_GITHUB/testing/ALU.v2
168@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
rst2
wire2=
9C:/Users/nirma/OneDrive/Documents/AA_GITHUB/testing/ALU.v2
178@Z8-11241h px� 
�
synthesizing module '%s'%s4497*oasys2
CPU2
 2=
9C:/Users/nirma/OneDrive/Documents/AA_GITHUB/testing/CPU.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
ALU2
 2=
9C:/Users/nirma/OneDrive/Documents/AA_GITHUB/testing/ALU.v2
18@Z8-6157h px� 
�
module '%s' not found439*oasys2	
Divider2=
9C:/Users/nirma/OneDrive/Documents/AA_GITHUB/testing/ALU.v2
158@Z8-439h px� 
�
!failed synthesizing module '%s'%s4496*oasys2
ALU2
 2=
9C:/Users/nirma/OneDrive/Documents/AA_GITHUB/testing/ALU.v2
18@Z8-6156h px� 
�
!failed synthesizing module '%s'%s4496*oasys2
CPU2
 2=
9C:/Users/nirma/OneDrive/Documents/AA_GITHUB/testing/CPU.v2
38@Z8-6156h px� 
�
%s*synth2v
tFinished Synthesize : Time (s): cpu = 00:00:04 ; elapsed = 00:00:10 . Memory (MB): peak = 1088.188 ; gain = 558.051
h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
132
02
02
4Z4-41h px� 
<

%s failed
30*	vivadotcl2
synth_designZ4-43h px� 
N
Command failed: %s
69*common2
Vivado Synthesis failedZ17-69h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Thu Aug 22 13:04:33 2024Z17-206h px� 


End Record