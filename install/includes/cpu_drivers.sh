# CPU microcode selection
echo -e "${GREEN}"
figlet "CPU Driver"
echo -e "${NONE}"

echo "Detected CPU: $DETECTED_CPU"
echo "Select your CPU manufacturer:"
CPU_TYPE=$(gum choose --selected="$DETECTED_CPU" "AMD" "Intel")

if [ "$CPU_TYPE" == "AMD" ]; then
  cpu_packages=(
    "amd-ucode"
  )
else
  cpu_packages=(
    "intel-ucode"
  )
fi

echo ":: Installing $CPU_TYPE CPU packages"
_installPackages "${cpu_packages[@]}";