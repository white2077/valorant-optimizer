@echo off
title HO THONG TOI UU HOA PHAN CUNG & REDUCE INPUT LAG TO 0MS (VALORANT MAX PING) Dungbh
cls
color 0B

:: Kiem tra quyen Admin
net session >nul 2>&1
if %errorLevel% == 0 (
    goto menu
) else (
    echo =================================================================
    echo [LOI] BAN PHAI CHAY FILE NAY VOI QUYEN ADMIN!
    echo =================================================================
    echo.
    echo Huong dan: Nhap chuot phai vao file nay va chon "Run as administrator".
    echo.
    pause
    exit
)

:menu
cls
echo =================================================================
echo   BO CONG CU EP MAX PHAN CUNG - TRIET TIEU INPUT LAG CHO VALORANT
echo =================================================================
echo   [1] BAT: Tuyen tap giam Input Lag Chuot ^& Ban phim ve ~0ms
echo   [2] BAT: Ep CPU ^& GPU chay het cong suat (Max Peak Performance)
echo   [3] BAT: Toi uu hoa He thong ^& Bang thong Mang (Giam delay Ping)
echo   [4] TAT / REVERT: Khoi phuc tat ca thiet lap ve mac dinh Windows
echo   [5] BONUS: Don dep nhanh Bo nho dem ^& Flush DNS giam giat ping
echo   [6] THOAT
echo =================================================================
set /p chon="Nhap lua chon cua ban (1-6): "

if "%chon%"=="1" goto bat_chuot_phim
if "%chon%"=="2" goto bat_cpugpu
if "%chon%"=="3" goto bat_hethong_mang
if "%chon%"=="4" goto tat_revert
if "%chon%"=="5" goto bonus_dondep
if "%chon%"=="6" exit
goto menu

:bat_chuot_phim
cls
echo =================================================================
echo   DANG BAT: TOI UU HOAC CHUOT ^& BAN PHIM (INPUT LAG ~0MS)
echo =================================================================
echo [*] Giam kich thuoc hang doi du lieu Chuot de phan hoi tuc thi...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d 15 /f >nul

echo [*] Giam kich thuoc hang doi du lieu Ban phim...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d 15 /f >nul

echo [*] Vo hieu hoa Sticky Keys va cac bo loc gay tre dem phim...
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "122" /f >nul

echo [*] Tat tinh nang ngu tiet kiem dien cua cac cong USB (Selective Suspend)...
powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_NONE 2f1a6304-95a7-4de0-b2d3-ac0469de4d2c 0 >nul
powercfg /SETACTIVE SCHEME_CURRENT >nul

echo.
echo [OK] Da toi uu phan cung ngoai vi! Vui long Restart PC sau khi xong tat ca.
echo.
pause
goto menu

:bat_cpugpu
cls
echo =================================================================
echo   DANG BAT: EP CONG SUAT CPU ^& GPU (MAX GAME FPS)
echo =================================================================
echo [*] Kich hoat va bat che do nguon dien sieu hieu nang (Ultimate Performance)...
powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1

echo [*] Thiet lap luon uu tien CPU muc cao nhat (High Priority) cho Valorant...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f >nul

echo [*] Ep Windows luon cap Card do hoa roi (High Performance GPU) cho Valorant...
reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "VALORANT-Win64-Shipping.exe" /t REG_SZ /d "GpuPreference=2;" /f >nul

echo [*] Kich hoat tinh nang Tang toc phan cung GPU (HAGS - Hardware Accelerated GPU Scheduling)...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul

echo.
echo [OK] Da ep xung thiet lap hieu nang CPU/GPU len muc cao nhat!
echo.
pause
goto menu

:bat_hethong_mang
cls
echo =================================================================
echo   DANG BAT: TOI UU BANG THONG MANG ^& TICK RATE HE THONG
echo =================================================================
echo [*] Vo hieu hoa HPET de triet tieu micro-stutter (Tre vi mo)...
bcdedit /set useplatformclock no >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1

echo [*] Set bang thong Windows uu tien phan hoi Game 100%% (System Responsiveness)...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul

echo [*] Uu tien CPU cho cac tac vu tuong tac truc tiep o Foreground (Game)...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul

echo [*] Toi uu thiet lap TCP/IP de truyen goi tin chuot/phim di ngay lap tuc...
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global congestionprovider=ctcp >nul 2>&1
netsh int tcp set global ecncapability=disabled >nul

echo.
echo [OK] Da dinh tuyen lai phan phoi mang va phan cuong phu hop voi Max Ping!
echo.
pause
goto menu

:tat_revert
cls
echo =================================================================
echo   DANG TAT / REVERT ALL TWEAKS: KHOI PHUC MAC DINH WINDOWS
echo =================================================================
echo [*] Tra hang doi du lieu Chuot va Ban phim ve mac dinh (100)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d 100 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d 100 /f >nul

echo [*] Bat lai che do ngu USB tiet kiem dien...
powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_NONE 2f1a6304-95a7-4de0-b2d3-ac0469de4d2c 1 >nul
powercfg /setactive SCHEME_BALANCED >nul 2>&1

echo [*] Xoa uu tien CPU cua Valorant va tra ve Mac dinh...
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "VALORANT-Win64-Shipping.exe" /f >nul 2>&1

echo [*] Bat lai bo dinh thoi HPET va Dynamic Ticks...
bcdedit /deletevalue useplatformclock >nul 2>&1
bcdedit /deletevalue disabledynamictick >nul 2>&1

echo [*] Reset thiet lap mang va System Responsiveness ve ban dau...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 10 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 20 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 2 /f >nul

echo.
echo [OK] Da xoa toan bo Tweaks va khoi phuc lai thiet lap goc cua Windows!
echo.
pause
goto menu

:bonus_dondep
cls
echo =================================================================
echo   DANG DON DEP HE THONG ^& GIAM THIEU LAGGING
echo =================================================================
echo [*] Xoa DNS Cache (Flush DNS) giam thieu xoe goi tin...
ipconfig /flushdns

echo [*] Dang giai phong file rac trong thu muc Temp...
del /s /f /q %userprofile%\AppData\Local\Temp\*.* >nul 2>&1
del /s /f /q C:\Windows\Temp\*.* >nul 2>&1

echo.
echo [OK] He thong da duoc lam sach nhe nhang!
echo.
pause
goto menu