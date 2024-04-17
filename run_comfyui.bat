echo off
set startDir=%CD%
%startDir%\ComfyUI\venv\Scripts\python %startDir%\ComfyUI\main.py --auto-launch
cd %startDir%
pause
