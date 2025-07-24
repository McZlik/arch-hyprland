# GPU driver selection
echo -e "${GREEN}\nGPU Selection${NONE}"
echo "Detected GPU: $DETECTED_GPU"
echo "Select your GPU manufacturer:"
GPU_TYPE=$(gum choose --selected="$DETECTED_GPU" "AMD" "NVIDIA" "Intel")

if [ "$GPU_TYPE" == "AMD" ]; then
  gpu_packages=(
    "mesa"
    "vulkan-radeon"
    "libva-mesa-driver"
  )
elif [ "$GPU_TYPE" == "NVIDIA" ]; then
  gpu_packages=(
    "mesa"
    "nvidia"
    "nvidia-utils"
    "nvidia-settings"
    "libva-nvidia-driver"
  )

  # Adding NVIDIA-specific environment variables
  echo ":: Adding NVIDIA-specific configurations..."
  mkdir -p "$DIR_DOTFILES/.config/hypr"
  cat > "$DIR_DOTFILES/.config/hypr/nvidia.conf" << EOL
# NVIDIA-specific environment variables
env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
env = WLR_NO_HARDWARE_CURSORS,1
EOL
else
  gpu_packages=(
    "mesa"
    "vulkan-intel"
    "intel-media-driver"
    "libva-intel-driver"
  )
fi

echo ":: Installing $GPU_TYPE GPU packages"
_installPackages "${gpu_packages[@]}";