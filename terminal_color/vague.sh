 #!/usr/bin/env bash
# Tema personalizado para GNOME Terminal basado en tu esquema Alacritty

PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')

# Colores principales
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ background-color '#10100E'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ foreground-color '#cdcdcd'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ bold-color '#d7d7d7'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ use-theme-colors false

# Paleta personalizada (normal + bright)
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ palette "[
'#252530', '#d8647e', '#7fa563', '#f3be7c',
'#6e94b2', '#bb9dbd', '#aeaed1', '#cdcdcd',
'#606079', '#e08398', '#99b782', '#f5cb96',
'#8ba9c1', '#c9b1ca', '#bebeda', '#d7d7d7'
]"

echo "Tema aplicado a GNOME Terminal 🎨"

