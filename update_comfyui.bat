echo off
REM This file update only git-versions of "ComfyUI" + "ComfyUI-Manager".
cls
echo Make sure that GIT is in the PATH
set startDir=%CD%
set comfy=%startDir%\ComfyUI
set venv=%comfy%\venv
set scripts=%venv%\Scripts
echo ===================================
echo Updating "ComfyUI" via GIT
echo ===================================
cd %comfy%
git pull
cd %startDir%
echo ===================================
echo Updating "ComfyUI-Manager" via GIT
echo ===================================
cd %comfy%\custom_nodes\ComfyUI-Manager
git pull
cd %startDir%
echo ===================================
echo Updating "RUS Localisation" via GIT
echo ===================================
cd %comfy%\custom_nodes\NStor-ComfyUI-Translation
git pull
cd %startDir%
echo ===================================
echo Updating "Crystools" via GIT
echo ===================================
cd %comfy%\custom_nodes\ComfyUI-Crystools
git pull
cd %startDir%
echo ===================================
echo Updating "Comfy_mtb" via GIT
echo ===================================
cd %comfy%\custom_nodes\comfy_mtb
git pull
cd %startDir%
echo ===================================
echo Complete Update
echo ===================================
pause
