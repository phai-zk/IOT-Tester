@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

set YOUR_FILES_PATH=..
set OBJ_PATH=.\obj_test_files
set OUTPUT_PATH=.\output_files
set INPUT_PATH=.\temp
set LIB=.\utils
set SPECIAL_TEST_PATH=%LIB%\special_test\quiz8_test.c

REM Function to run a test case
goto :main

:run_test_case
set input=%~1
set test=%~2

REM Run the program with input
echo %input% > %INPUT_PATH%\temp_input.txt

echo Test %test% Quiz2 Log >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt 

REM Run user's program
%OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe < %INPUT_PATH%\temp_input.txt > %OUTPUT_PATH%\quiz%QUIZ%\user_output.txt

REM Run test program silently
%OBJ_PATH%\quiz%QUIZ%\test_quiz%QUIZ%.exe < %INPUT_PATH%\temp_input.txt > %OUTPUT_PATH%\quiz%QUIZ%\test_output.txt

REM Compare outputs
fc /N %OUTPUT_PATH%\quiz%QUIZ%\user_output.txt %OUTPUT_PATH%\quiz%QUIZ%\test_output.txt > nul 2>&1
set status=%errorlevel%

echo ================= OUTPUT TEST %test% ==================== >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt

if %status% == 0 (
    type %OUTPUT_PATH%\quiz%QUIZ%\test_output.txt >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt
    echo $ >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt
    call :print " %test%)✓ " Green 1
    echo ===================== SUCCESS ======================= >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt
) else (
    fc %OUTPUT_PATH%\quiz%QUIZ%\user_output.txt %OUTPUT_PATH%\quiz%QUIZ%\test_output.txt >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt
    call :print " %test%)✗ " Red 1
    echo =====================   FAIL  ======================= >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt
)
goto :eof

:test_traffics
set q=%1
set LOG_FILE=%YOUR_FILES_PATH%\quiz%q%\log_%q%.txt
if exist %LOG_FILE% del %LOG_FILE%

if "%q%"=="1" (
    set /p=Test:<nul 
    call :quiz1_test
    if exist %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe del %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe
) else if "%q%"=="2" (
    set /p=Test:<nul 
    call :run_test_case "5\n5" 1
    call :run_test_case "100\n10" 2
    call :run_test_case "3325\n15" 3
    call :run_test_case "2141241\n21312" 4
    call :run_test_case "213\na" 5
    call :run_test_case "324234\n0" 6
    call :run_test_case "21241\n4323" 7
    call :run_test_case "51\n2147483647" 8
    if exist %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe del %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe
    echo.
) else if "%q%"=="3" (
    set /p=Test:<nul 
    call :run_test_case "12\n7" 1
    call :run_test_case "88\n42" 2
    call :run_test_case "999\n123" 3
    call :run_test_case "56\n78" 4
    call :run_test_case "2147483647\2147483649" 5
    call :run_test_case "0\n9999" 6
    call :run_test_case "42\2141241-1" 7
    call :run_test_case "apple\n314" 8
    if exist %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe del %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe
    echo.
) else if "%q%"=="4" (
    set /p=Test:<nul  
    call :run_test_case "50" 1
    call :run_test_case "80" 2
    call :run_test_case "1000" 3
    call :run_test_case "2141241" 4
    call :run_test_case "10" 5
    call :run_test_case "-5" 6
    call :run_test_case "60" 7
    call :run_test_case "51" 8
    call :run_test_case "68" 9
    call :run_test_case "98" 10
    call :run_test_case "76" 11
    call :run_test_case "100" 12
    call :run_test_case "72" 13
    if exist %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe del %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe
    echo.
) else if "%q%"=="5" (
    set /p=Test:<nul  
    call :run_test_case "10" 1
    call :run_test_case "8" 2
    call :run_test_case "12" 3
    call :run_test_case "80" 4
    call :run_test_case "100" 5
    call :run_test_case "500" 6
    call :run_test_case "\0" 7
    call :run_test_case "A" 8
    call :run_test_case "654522" 9
    if exist %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe del %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe
    echo.
) else if "%q%"=="6" (
    set /p=Test:<nul  
    call :run_test_case "101" 1
    call :run_test_case "997" 2
    call :run_test_case "123456" 3
    call :run_test_case "7919" 4
    call :run_test_case "10201" 5
    call :run_test_case "10001" 6
    call :run_test_case "1223" 7
    call :run_test_case "104730" 8
    call :run_test_case "104729" 9
    call :run_test_case "100000000" 10
    if exist %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe del %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe
    echo.
) else if "%q%"=="7" (
    set /p=Test:<nul  
    call :run_test_case "5" 1
    call :run_test_case "2" 2
    call :run_test_case "3" 3
    call :run_test_case "6" 4
    call :run_test_case "9" 5
    call :run_test_case "15" 6
    call :run_test_case "11" 7
    call :run_test_case "20" 8
    if exist %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe del %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe
    echo.
) else if "%q%"=="8" (
    set /p=Test:<nul  
    call :run_test_case "" 1
    call :run_test_case "" 2
    call :run_test_case "" 3
    call :run_test_case "" 4
    call :run_test_case "" 5
    call :run_test_case "" 6
    call :run_test_case "" 7
    call :run_test_case "" 8
    if exist %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe del %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe
    echo.
) else if "%q%"=="9" (
    set /p=Test:<nul  
    call :run_test_case "3" 1
    call :run_test_case "4" 2
    call :run_test_case "5" 3
    call :run_test_case "6" 4
    if exist %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe del %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe
    echo.
) else (
    call :print "Test: Not implemented yet" Red 0
    exit /b 0
)
call :print "Log files are in %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt" Blue 0
echo.
goto :eof

:print
setlocal enabledelayedexpansion
set text=%1
set color=%2
set newline=%3
if %newline% neq 0 (
    powershell -Command "Write-Host '!text!' -NoNewline -ForegroundColor !color!"
) else (
    powershell -Command "Write-Host '!text!' -ForegroundColor !color!"
)
endlocal
goto :eof

:quiz1_test
REM Run user's program with input
%OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe > %OUTPUT_PATH%\quiz%QUIZ%\user_output.txt
echo Test Quiz1 Log: >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt
echo ====================== FILES OUTPUT ====================== >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt
type %OUTPUT_PATH%\quiz%QUIZ%\user_output.txt >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt
echo $ >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt
REM Check if file has content
for %%A in (%OUTPUT_PATH%\quiz%QUIZ%\user_output.txt) do set size=%%~zA 
if %size% gtr 0 (
    call :print " 1)✓ " Green 1
    echo ======================    SUCCESS   ====================== >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt
) else (
    call :print " 1)✗ " Red 1
    echo ======================      FAIL    ====================== >> %YOUR_FILES_PATH%\quiz%QUIZ%\log_%QUIZ%.txt
)
echo.
if exist %OUTPUT_PATH%\quiz%QUIZ%\user_output.txt del %OUTPUT_PATH%\quiz%QUIZ%\user_output.txt
goto :eof

:main
set QUIZ=%1

if "%QUIZ%"=="" (
    echo Usage: %0 ^<quiz_number^>
    exit /b 1
)

if "%QUIZ%"=="8" (
    gcc %SPECIAL_TEST_PATH% %YOUR_FILES_PATH%\quiz%QUIZ%\quiz%QUIZ%.c %LIB%\utils.a -o %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe 2>compile_error.txt
) else (
    gcc %YOUR_FILES_PATH%\quiz%QUIZ%\quiz%QUIZ%.c -o %OBJ_PATH%\quiz%QUIZ%\quiz%QUIZ%.exe 2>compile_error.txt
)

call :print "================= Quiz %QUIZ% ====================" Yellow 0

if %errorlevel% neq 0 (
    call :print Debug: Compilation failed Red 0
    call :print Debug: Compile error: Red 0
    type compile_error.txt
    if exist compile_error.txt del compile_error.txt
    exit /b 1
) else (
    if exist %OUTPUT_PATH% rmdir /s /q %OUTPUT_PATH%
    mkdir %OUTPUT_PATH%
    for /l %%i in (1,1,10) do (
        mkdir %OUTPUT_PATH%\quiz%%i
    )
    call :test_traffics %QUIZ%
)

if exist compile_error.txt del compile_error.txt
