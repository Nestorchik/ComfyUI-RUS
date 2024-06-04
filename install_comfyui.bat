echo off
REM Этот файо инсталлирует git-версии
REM "ComfyUI" + "ComfyUI-Manager" + "Crystools" + "mbt" + "RUS локализацию" 
REM с "torch-cuda" для NVIDIA видеокарт
cls
echo Make sure that GIT is in the PATH
echo Change "python=c:\p311\python.exe" to the actual location of python 3.11 in the system.
REM You mush have installed GIT with in PATH
REM В системе должен быть установлен GIT в PATH
REM Set here resl psth to you Python 3.11
REM Установи здесь реальный путь к питону 3.11
set python=c:\p311\python.exe
set startDir=%CD%
set comfy=%startDir%\ComfyUI
set venv=%comfy%\venv
set scripts=%venv%\Scripts
echo ======================================
echo Downloading "ComfyUI"
echo ======================================
git clone https://github.com/comfyanonymous/ComfyUI.git
echo ======================================
echo Installing VENV for ComfyUI
%python% -m venv %venv%
echo ======================================
echo Updating PIP version
%scripts%\python -m pip install --upgrade pip
echo ======================================
echo Installing ComfyUI python packages
%scripts%\python -m pip install -r %comfy%\requirements.txt
echo ======================================
echo Uninstalling CPU python packages
%scripts%\python -m pip uninstall torch -y
echo ======================================
echo Installing GPU-cuda TORCH python packages
%scripts%\python -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
echo ======================================
echo Installing ComfyUI-Manager custom_node
cd %comfy%\custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
cd %startDir%
echo ======================================
echo Installing ComfyUI-Manager python packages
%scripts%\python -m pip install -r %comfy%\custom_nodes\ComfyUI-Manager\requirements.txt
echo ======================================
echo Installing NStor-ComfyUI-Translation
cd %comfy%\custom_nodes
git clone https://github.com/Nestorchik/NStor-ComfyUI-Translation.git
echo ======================================
echo Installing Crystools
git clone https://github.com/crystian/ComfyUI-Crystools.git
echo ======================================
echo Installing Crystools python packages
%scripts%\python -m pip install -r %comfy%\custom_nodes\ComfyUI-Crystools\requirements.txt
echo ======================================
echo Installing comfy_mbt
git clone https://github.com/melMass/comfy_mtb.git
echo ======================================
echo Installing comfy_mbt python packages
%scripts%\python -m pip install -r %comfy%\custom_nodes\comfy_mtb\requirements.txt
cd %startDir%
echo ======================================
echo Installing sucessful
echo ======================================
echo Don't forget to upload or copy the models to the "ComfyUI\models\checkpoints" folder,
echo or download SymLinkCreator https://github.com/Nestorchik/SymLinkCreator.git
echo to share safetensors models to ComfyUI from existing repositories/
echo ==================================
echo Starting ComfyUI
echo ==================================
echo
echo Start ComfyUI as http://127.0.0.1:8188
echo
%scripts%\python %comfy%\main.py --auto-launch
pause


