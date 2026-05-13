@echo off
title Claude / DeepSeek Launcher

REM move to current script folder
cd /d "%~dp0"

REM ==================================
REM Claude / DeepSeek Launcher
REM Windows Version
REM ==================================

REM =========================
REM Check Node.js
REM =========================

where node >nul 2>nul

if %errorlevel% neq 0 (
    cls
    echo ==================================
    echo Node.js not found
    echo ==================================
    echo.
    echo Please install Node.js first:
    echo https://nodejs.org/
    echo.
    pause
    start https://nodejs.org/
    exit
)

REM =========================
REM Auto Install Claude CLI
REM =========================

where claude >nul 2>nul

if %errorlevel% neq 0 (
    echo.
    echo Installing Claude CLI...
    call npm install -g @anthropic-ai/claude-code
)

REM =========================
REM Auto Install DeepSeek CLI
REM =========================

where deepseek >nul 2>nul

if %errorlevel% neq 0 (
    echo.
    echo Installing DeepSeek CLI...
    call npm install -g deepseek-tui
)

REM =========================
REM Main Loop
REM =========================

:menu

cls

echo ==================================
echo   Claude / DeepSeek Launcher
echo ==================================
echo.

REM Claude Status

where claude >nul 2>nul

if %errorlevel% neq 0 (
    echo Claude CLI: Missing
) else (
    echo Claude CLI: Installed
)

REM DeepSeek Key Status

if defined DEEPSEEK_API_KEY (
    echo DeepSeek API Key: OK
) else (
    echo DeepSeek API Key: Missing
)

echo.
echo ==================================
echo MENU
echo ==================================

echo 0. Setup DeepSeek API Key
echo 1. Remove DeepSeek API Key
echo 2. Claude
echo 3. DeepSeek
echo 4. Exit

echo.

set /p choice=Choose: 

REM =========================
REM Setup DeepSeek API Key
REM =========================

if "%choice%"=="0" (

    echo.
    set /p deepseek_key=Paste DeepSeek API Key: 

    setx DEEPSEEK_API_KEY "%deepseek_key%"
    set DEEPSEEK_API_KEY=%deepseek_key%

    echo.
    echo DeepSeek API Key saved
    echo.

    pause
    goto menu
)

REM =========================
REM Remove DeepSeek API Key
REM =========================

if "%choice%"=="1" (

    setx DEEPSEEK_API_KEY ""
    set DEEPSEEK_API_KEY=

    echo.
    echo DeepSeek API Key removed
    echo.

    pause
    goto menu
)

REM =========================
REM Launch Claude
REM =========================

if "%choice%"=="2" (

    cls

    echo Launching Claude...
    echo.

    claude

    echo.
    pause
    goto menu
)

REM =========================
REM Launch DeepSeek
REM =========================

if "%choice%"=="3" (

    if defined DEEPSEEK_API_KEY (

        cls

        echo Launching DeepSeek...
        echo.

        deepseek

        echo.
        pause
        goto menu

    ) else (

        echo.
        echo DeepSeek API Key not found
        echo Please setup API key first
        echo.

        pause
        goto menu
    )
)

REM =========================
REM Exit
REM =========================

if "%choice%"=="4" (
    exit
)

goto menu
