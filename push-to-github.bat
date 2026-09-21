@echo off
chcp 65001 > nul
title DentaFlow - Push Vercel App to GitHub
echo ===================================================
echo   DENTAFLOW - PUSH VERCEL APP KE GITHUB
echo ===================================================
echo Repo: https://github.com/santrimanofficial26-oss/APLIKASIDENTAFLOW.git
echo.

cd /d "%~dp0"

:: 1. Inisialisasi git jika belum ada
if not exist ".git" (
    echo [1/4] Menginisialisasi Git repository di folder vercel-app...
    git init
    git branch -M main
    git remote add origin https://github.com/santrimanofficial26-oss/APLIKASIDENTAFLOW.git
) else (
    echo [1/4] Git repository lokal sudah aktif.
)

:: 2. Tambahkan semua file di vercel-app
echo [2/4] Menambahkan file ke Git staging...
git add .

:: 3. Buat commit
echo [3/4] Membuat commit...
git commit -m "feat: DentaFlow Vercel iframe web application"

:: 4. Push ke GitHub (force push untuk memastikan HANYA folder ini yang ada di repo)
echo [4/4] Melakukan git push ke branch main...
git push -u origin main --force

if %errorlevel% equ 0 (
    echo.
    echo ===================================================
    echo   BERHASIL DIPUSH KE GITHUB!
    echo   Hanya file vercel-app yang ada di repository:
    echo   https://github.com/santrimanofficial26-oss/APLIKASIDENTAFLOW
    echo ===================================================
) else (
    echo.
    echo [GAGAL] Terjadi kesalahan saat push.
)

echo.
pause
