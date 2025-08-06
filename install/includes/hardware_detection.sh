# -----------------------------------------------------
# Hardware Detection Helper
# ----------------------------------------------------- 

_detectCPU() {
  if grep -q "GenuineIntel" /proc/cpuinfo; then
    echo "Intel"
  elif grep -q "AuthenticAMD" /proc/cpuinfo; then
    echo "AMD"
  else
    echo "Unknown"
  fi
}

_detectGPU() {
  # Check for NVIDIA GPU
  if lspci | grep -i "NVIDIA" | grep -i "VGA\|3D\|Display" > /dev/null; then
    echo "NVIDIA"
  # Check for AMD GPU
  elif lspci | grep -i "AMD\|ATI" | grep -i "VGA\|3D\|Display" > /dev/null; then
    echo "AMD"
  # Check for Intel GPU
  elif lspci | grep -i "Intel" | grep -i "VGA\|3D\|Display" > /dev/null; then
    echo "Intel"
  else
    echo "Unknown"
  fi
}

# Export the detected hardware for use in install scripts
export DETECTED_CPU=$(_detectCPU)
export DETECTED_GPU=$(_detectGPU)

echo -e "${GREEN}Hardware Detection${NONE}"
echo "Detected CPU: $DETECTED_CPU"
echo "Detected GPU: $DETECTED_GPU"
echo
