@ECHO OFF
CLS

:: Language
SET "IS_ZH=0"
FOR /F "tokens=2*" %%A IN ('REG QUERY "HKCU\Control Panel\Desktop" /v PreferredUILanguages 2^>NUL') DO SET "UILANG=%%B"
IF DEFINED UILANG (
    ECHO %UILANG% | FINDSTR /I "zh-TW zh-HK zh-MO" >NUL && SET "IS_ZH=1"
)
IF "%IS_ZH%"=="0" (
    FOR /F "tokens=2*" %%A IN ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Nls\Language" /v InstallLanguage 2^>NUL') DO SET "SYS_LANG=%%B"
    IF "%SYS_LANG%"=="0404" SET "IS_ZH=1"
    IF "%SYS_LANG%"=="0c04" SET "IS_ZH=1"
    IF "%SYS_LANG%"=="0484" SET "IS_ZH=1"
)

:: 2. Admin Check
>NUL 2>&1 REG.exe query "HKU\S-1-5-19"
IF %ERRORLEVEL% EQU 0 GOTO :Admin

:: 3. If no Admin
IF "%IS_ZH%"=="1" GOTO Msg_ZH
GOTO Msg_EN

:Msg_ZH
ECHO ============================================================
ECHO [錯誤] 權限不足！此程式需要系統管理員權限才能執行。
ECHO.
ECHO 請關閉此視窗，並點擊右鍵選擇：
ECHO 【以系統管理員身分執行】 (Run as administrator)
ECHO ============================================================
GOTO Msg_End

:Msg_EN
ECHO ============================================================
ECHO [ERROR] Insufficient privileges! Requires Administrator.
ECHO.
ECHO Please close this window, right-click and select:
ECHO [Run as administrator]
ECHO ============================================================

:Msg_End
ECHO.
PAUSE
EXIT /B

:Admin
pushd %~dp0

ECHO """""""""""""""""""""""""""""""""""""""""""""
ECHO "  ________ __________________  .____        "     
ECHO "  \_____  \\_  _____\______ \ |    |       "    
ECHO "   /  |  |  \|   __)  |    |  \|    |       "    
ECHO "  /   |  |  |   \   |    `   |    |___   "
ECHO "  \_______  \___  /  /_______  |_______ \  "
ECHO "          \/    \/           \/        \/  "
ECHO "                                           "
ECHO """""""""""""""""""""""""""""""""""""""""""""
ECHO.
ECHO Version: 2023/07/12
ECHO .................................................

:: 4. Main App
IF "%IS_ZH%"=="1" GOTO Menu_ZH
GOTO Menu_EN

:Menu_ZH
ECHO 請透過 USB 連接 EV3 主機，並關閉其他相關程式 (EV3-G, RobotC, CLEV3R...)
ECHO .................................................
ECHO 歡迎使用 EV3 常用工具安裝程式，請選擇安裝模式：
ECHO .................................................
ECHO.
ECHO 1 - 僅安裝電池檢視工具 (Battery View)
ECHO.
ECHO 2 - 安裝全部 (包含: 電池檢視, 電池效能測試, 馬達轉速測試)
ECHO. 
ECHO 3 - 離開
ECHO.
SET /P M=請輸入 1、2 或 3 後按下 Enter 鍵: 
GOTO Menu_End

:Menu_EN
ECHO Plz Conn the EV3 with USB and close other program(EV3-G, RobotC, CLEV3R..)
ECHO .................................................
ECHO Welcome to use EV3 Useful Apps Installer, Plz choose mode:
ECHO .................................................
ECHO.
ECHO 1 - Install Battery View Tool Only
ECHO.
ECHO 2 - Install All, Include: Battery View, 
ECHO   - Battery Benchmark Tester, Motor RPM Tester
ECHO. 
ECHO 3 - Exit
ECHO.
SET /P M=Type 1, 2, or 3 then press ENTER: 

:Menu_End
IF "%M%"=="1" GOTO BTV
IF "%M%"=="2" GOTO ALL
IF "%M%"=="3" GOTO EOF
GOTO EOF

:BTV
ECHO.
ECHO.
EV3BrickMagic.exe -confirmbeep -p=USB install "%~dp0EV3Apps\Battery View.zip"
ECHO.
ECHO.
PAUSE 
GOTO EOF

:ALL
ECHO.
ECHO.
EV3BrickMagic.exe -confirmbeep -p=USB install "%~dp0EV3Apps\Motor RPM Tester.zip"
ECHO.
ECHO.
EV3BrickMagic.exe -confirmbeep -p=USB install "%~dp0EV3Apps\Battery Tester.zip"
ECHO.
ECHO.
EV3BrickMagic.exe -confirmbeep -p=USB install "%~dp0EV3Apps\Battery View.zip"
ECHO.
ECHO.
PAUSE 
GOTO EOF

:EOF
EXIT /B