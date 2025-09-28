 #!/usr/bin/env bash
# Tema personalizado para GNOME Terminal basado en tu esquema Alacritty

PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')

# Colores principales
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ background-color '#101010'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ foreground-color '#C5C8C6'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ bold-color '#c0caf5'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ use-theme-colors false

# Paleta personalizada (normal + bright)
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ palette "[
'#101010', '#f7768e', '#9ece6a', '#e0af68',
'#7aa2f7', '#bb9af7', '#7dcfff', '#a9b1d6',
'#3b4261', '#f7768e', '#9ece6a', '#e0af68',
'#7aa2f7', '#bb9af7', '#7dcfff', '#c0caf5'
]"

echo "Tema aplicado a GNOME Terminal 🎨"

