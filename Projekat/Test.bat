@echo off

SET CONFIGURATION=Debug
SET PROJECT_NAME=ProcessWavFile
SET PROJECT_ULD="mod3/SULDWavTemplate/output/standalone/WavTemplate.uld"

: TO DO: Add additional command line args for your program
SET ARGS1= "1 -6.00 1 0"

SET SIMULATOR=C:\CirrusDSP\bin\cmdline_simulator.exe -silent

SET COMPARE="PCMCompare.exe"


: Delete log files first.

del /Q OutCmp\*
del /Q OutStreams\*


: For each Test stream
for %%f in (TestStreams\*.*) do ( 
	@echo Running tests for stream: %%~nf%%~xf

	: Execute Model 0, Model 1 and Model 2
	echo     model 0
    "ProcessWavFile\Debug\ProcessWavFile.exe" "%%f" "OutStreams//%%~nf_ARGS1_model0.wav" "%ARGS1%" 
	echo     model 1
	"mod1\ProcessWavFile\Debug\ProcessWavFile.exe" "%%f" "OutStreams//%%~nf_ARGS1_model1.wav" "%ARGS1%" 
	echo     model 2
	"mod2\ProcessWavFile\Debug\ProcessWavFile.exe" "%%f" "OutStreams//%%~nf_ARGS1_model2.wav" "%ARGS1%" 
	
	
		: Create .sbr file for testing Model 3 
	echo     model 3
	(
		@echo ^<?xml version="1.0" encoding="UTF-8" standalone="yes"?^>
		@echo ^<CL_PROJECT^>
		@echo     ^<argv^>%%f OutStreams\%%~nf_model3.wav^</argv^>
		@echo     ^<FILE_IO_CFG block_type="Input" channels_per_line="2" delay="0" file_mode="PCM" index="0" justification="Left" sample_format="LittleEndian" sample_rate="8000" sample_size="16"/^>
		@echo     ^<FILE_IO_CFG block_type="Output" channels_per_line="5" delay="0" file_mode="PCM" index="0" justification="Left" sample_format="LittleEndian" sample_rate="8000" sample_size="16"/^>
		@echo     ^<MEMORY_CFG^>
		@echo         ^<ULD_FILE disk_path=%PROJECT_ULD%/^>
		@echo     ^</MEMORY_CFG^>
		@echo     ^<PROFILE_CFG enable="on"/^>
		@echo     ^<SCP_CFG load_delay="0"/^>
		@echo ^</CL_PROJECT^>
	
	) > SimulatorConfigurationTemp.sbr
	
		
	: Execute Model 0
	%SIMULATOR% -project SimulatorConfigurationTemp.sbr -max_cycles 1000000

	: Generate new logs
	%COMPARE% OutStreams//%%~nf_ARGS1_model0.wav OutStreams//%%~nf_ARGS1_model1.wav 2> OutCmp//%%~nf_Model0_vs_Model1_ARGS1.txt
	%COMPARE% OutStreams//%%~nf_ARGS1_model1.wav OutStreams//%%~nf_ARGS1_model2.wav 2> OutCmp//%%~nf_Model1_vs_Model2_ARGS1.txt
	%COMPARE% OutStreams//%%~nf_ARGS1_model0.wav OutStreams//%%~nf_model3.wav %COMPARE_ARGS% 2> OutCmp//%%~nf_Model1_vs_Model3.txt
	
)