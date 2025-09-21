 #!/usr/bin/env bash
# Tema personalizado para GNOME Terminal basado en tu esquema Alacritty

PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')

# Colores principales
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ background-color '#0a0c10'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ foreground-color '#f0f3f6'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ bold-color '#f0f3f6'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ use-theme-colors false

# Paleta personalizada (normal + bright)
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ palette "[
'#7a828e', '#ff9492', '#26cd4d', '#f0b72f',
'#71b7ff', '#cb9eff', '#39c5cf', '#d9dee3',
'#9ea7b3', '#ffb1af', '#4ae168', '#f7c843',
'#91cbff', '#cb9eff', '#39c5cf', '#d9dee3'
]"

echo "Tema aplicado a GNOME Terminal 🎨"

